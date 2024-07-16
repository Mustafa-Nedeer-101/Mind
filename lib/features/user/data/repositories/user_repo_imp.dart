import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind/features/user/business/entities/user_intity.dart';
import 'package:mind/features/user/business/repositories/user_repo.dart';
import 'package:mind/features/user/data/datasources/user_local_data_source.dart';
import 'package:mind/features/user/data/datasources/user_remote_datasource.dart';

import 'package:mind/features/user/data/models/user_model.dart';
import 'package:mind/utils/errors/exceptions.dart';

import 'package:mind/utils/errors/failure.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../utils/controllers/network_manager.dart';

class UserRepoImp implements UserRepo {
  final UserLocalDataSource userLocalDataSource;
  final UserRemoteDataSource userRemoteDataSource;

  UserRepoImp(
      {required this.userLocalDataSource, required this.userRemoteDataSource});

  @override
  Future<Either<Failure, String?>> changeUserImage(
      {required UserEntity user}) async {
    try {
      // Pick the image file
      final pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);

      if (pickedFile == null) {
        return const Right(null); // User canceled the picker
      }

      // Save it in the DocumentsDirectory
      final Directory appDocsDir = await getApplicationDocumentsDirectory();
      final String path = appDocsDir.path;

      File imageFile = File(pickedFile.path);
      final File localImage = await imageFile
          .copy('$path/profile_image_${Timestamp.now().toDate()}.png');

      await userLocalDataSource.changeUserImage(path: imageFile.path);

      return Right(localImage.path);
    } catch (e) {
      return Left(CacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> saveUser({required UserEntity user}) async {
    try {
      await userLocalDataSource.saveUser(user: user);

      return const Right(true);
    } catch (e) {
      return Left(CacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      UserModel user = await userLocalDataSource.getUser();

      final bool isConnected = await NetworkManager.instance.isConnected();

      // Set Updated Ranking
      if (isConnected && user.rankingUpdate.value) {
        // Ensure remote link
        if (user.id.value.isEmpty) {
          user.id.value = await userRemoteDataSource.createUserLink(
              name: user.name.value, points: user.points.value);
        }

        // Update remote points
        userRemoteDataSource.updatePoints(
            id: user.id.value, points: user.points.value);

        // Ranking
        user.ranking.value =
            await userRemoteDataSource.getRanking(points: user.points.value);
      }

      userLocalDataSource.saveUser(user: user);
      return Right(user);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(errorMessage: e.code));
    } on FormatException catch (e) {
      return Left(FormatFailure(errorMessage: e.message));
    } on PlatformException catch (e) {
      return Left(PlatformFailure(errorMessage: e.code));
    } on CacheException catch (e) {
      return Left(CacheFailure(errorMessage: e.toString()));
    } catch (e) {
      return Left(UnknownFailure(errorMessage: e.toString()));
    }
  }
}

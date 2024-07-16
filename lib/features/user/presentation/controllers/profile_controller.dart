import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/common/loaders/loaders.dart';
import 'package:mind/features/user/business/entities/user_intity.dart';
import 'package:mind/features/user/business/usecases/change_user_iamge.dart';
import 'package:mind/features/user/business/usecases/get_user_usecase.dart';
import 'package:mind/features/user/business/usecases/save_user_usecase.dart';
import 'package:mind/features/user/data/datasources/user_local_data_source.dart';
import 'package:mind/features/user/data/datasources/user_remote_datasource.dart';
import 'package:mind/features/user/data/repositories/user_repo_imp.dart';
import '../../../../utils/audio/audio_players.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/errors/failure.dart';

class CustomProfileController extends GetxController {
  // variables
  UserRepoImp repository = UserRepoImp(
    userLocalDataSource: UserLocalDataSourceImp(),
    userRemoteDataSource: UserRemoteDatasourceImp(),
  );

  // For Widget Display
  Failure? failure;
  Rx<UserEntity>? user;

  @override
  void onInit() async {
    super.onInit();
    await eitherFailureOrUser();
  }

  Future eitherFailureOrUser() async {
    final failureOrUser = await GetUser(userRepo: repository).call();

    failureOrUser.fold(
      (newFailure) {
        user = null;
        failure = newFailure;
        update();
      },
      (newUser) {
        user = newUser.obs;

        // Background Music
        CustomAudioPlayersController.musicEnabled =
            user!.value.musicEnabled.value;
        CustomAudioPlayersController.start();
        failure = null;

        update();
      },
    );
  }

  // Background Music
  enableDisableMusic(bool val) async {
    user!.value.musicEnabled.value = val;
    CustomAudioPlayersController.musicEnabled = val;
    CustomAudioPlayersController.canPlay = val;

    if (val) {
      CustomAudioPlayersController.playRandomSong();
    } else {
      CustomAudioPlayersController.stopMusic();
    }

    final failureOrBool =
        await SaveUserUsecase(userRepo: repository).call(user: user!.value);

    failureOrBool.fold(
      (newFailure) {
        user!.value.musicEnabled.value = false;
        CustomLoaders.errorSnackbar(
            title: 'Oh No', message: newFailure.errorMessage);
      },
      (newBool) {},
    );
  }

  // Auto Ranking
  enableDisableRanking(bool val) async {
    user!.value.rankingUpdate.value = val;

    final failureOrBool =
        await SaveUserUsecase(userRepo: repository).call(user: user!.value);

    // Update Ranking immediatly if enabled
    if (val) {
      final eitherFailureOrUser = await GetUser(userRepo: repository).call();

      eitherFailureOrUser.fold((gotFailure) {}, (gotUser) {
        user!.value.ranking.value = gotUser.ranking.value;
      });
    }

    failureOrBool.fold(
      (newFailure) {
        CustomLoaders.errorSnackbar(
            title: 'Oh No', message: newFailure.errorMessage);
      },
      (newBool) {},
    );
  }

  // Change the user's image
  changeImage() async {
    final eitherFailureOrString =
        await ChangeUserIamge(userRepo: repository).call(user: user!.value);

    // change user variable in controller
    eitherFailureOrString.fold((gotFailure) {}, (gotString) {
      if (gotString != null) {
        user!.value.image.value = gotString;
      }
    });
  }

  // Change the user's name
  changeName({required String name}) async {
    user!.value.name.value = name;

    final eitherFailureOrString =
        await SaveUserUsecase(userRepo: repository).call(user: user!.value);

    // change user variable in controller
    eitherFailureOrString.fold((gotFailure) {
      CustomLoaders.errorSnackbar(
          title: 'Oh No!', message: 'Could not change your name');
    }, (gotBoolean) {});
  }

  // Add points to user's points
  addPoints({required int pointsToAdd}) async {
    user!.value.points.value += pointsToAdd;

    final failureOrBool =
        await SaveUserUsecase(userRepo: repository).call(user: user!.value);

    failureOrBool.fold(
      (newFailure) {
        CustomLoaders.errorSnackbar(
            title: 'Oh No', message: newFailure.errorMessage);
      },
      (newBool) {},
    );
  }

  // Enlarge profile image
  void showEnlaredImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: CSizes.defaultSpace * 2,
                        horizontal: CSizes.defaultSpace),
                    child: image.isEmpty
                        ? const Image(
                            image: AssetImage(CImages.defaultUserImage))
                        : Image(
                            image: FileImage(File(image)),
                          ),
                  ),
                  const SizedBox(
                    height: CSizes.spaceBtwSections,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: const Text('Close')),
                    ),
                  )
                ],
              ),
            ));
  }
}

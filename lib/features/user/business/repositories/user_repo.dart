import 'package:dartz/dartz.dart';
import 'package:mind/features/user/business/entities/user_intity.dart';
import 'package:mind/core/errors/failure.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntity>> getUser();

  Future<Either<Failure, bool>> saveUser({required UserEntity user});

  Future<Either<Failure, String?>> changeUserImage({required UserEntity user});
}

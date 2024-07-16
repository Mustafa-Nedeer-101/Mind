import 'package:dartz/dartz.dart';
import 'package:mind/features/user/business/entities/user_intity.dart';
import 'package:mind/features/user/business/repositories/user_repo.dart';

import '../../../../utils/errors/failure.dart';

class GetUser {
  final UserRepo userRepo;

  GetUser({required this.userRepo});

  Future<Either<Failure, UserEntity>> call() async {
    return await userRepo.getUser();
  }
}

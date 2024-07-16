import 'package:dartz/dartz.dart';
import 'package:mind/features/user/business/repositories/user_repo.dart';

import '../../../../utils/errors/failure.dart';
import '../entities/user_intity.dart';

class ChangeUserIamge {
  final UserRepo userRepo;

  ChangeUserIamge({required this.userRepo});

  Future<Either<Failure, String?>> call({required UserEntity user}) async {
    return await userRepo.changeUserImage(user: user);
  }
}

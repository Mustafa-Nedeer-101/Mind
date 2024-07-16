import 'package:dartz/dartz.dart';

import '../../../../utils/errors/failure.dart';
import '../entities/user_intity.dart';
import '../repositories/user_repo.dart';

class SaveUserUsecase {
  final UserRepo userRepo;

  SaveUserUsecase({required this.userRepo});

  Future<Either<Failure, bool>> call({required UserEntity user}) async {
    return await userRepo.saveUser(user: user);
  }
}

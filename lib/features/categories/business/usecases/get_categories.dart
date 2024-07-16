import 'package:dartz/dartz.dart';
import 'package:mind/features/categories/business/enities/category_einity.dart';
import 'package:mind/features/categories/business/repositories/category_repo.dart';
import 'package:mind/utils/errors/failure.dart';

class GetCategories {
  final CategoryRepo categoryRepo;

  GetCategories({required this.categoryRepo});

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await categoryRepo.getCategories();
  }
}

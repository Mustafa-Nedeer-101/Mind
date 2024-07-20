import 'package:dartz/dartz.dart';
import 'package:mind/features/categories/business/enities/category_einity.dart';
import 'package:mind/features/categories/business/repositories/category_repo.dart';
import 'package:mind/core/errors/failure.dart';

class GetCategoriesUsecase {
  final CategoryRepo categoryRepo;

  GetCategoriesUsecase({required this.categoryRepo});

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await categoryRepo.getCategories();
  }
}

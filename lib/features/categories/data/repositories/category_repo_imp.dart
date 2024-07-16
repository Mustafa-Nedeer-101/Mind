import 'package:dartz/dartz.dart';

import 'package:mind/features/categories/business/enities/category_einity.dart';
import 'package:mind/features/categories/data/datasources/categories_local_datasource.dart';

import 'package:mind/utils/errors/failure.dart';

import '../../business/repositories/category_repo.dart';

class CategoryRepoImp implements CategoryRepo {
  final CategoriesLocalDataSource dataSource;

  CategoryRepoImp({required this.dataSource});
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final List<CategoryEntity> categories = await dataSource.getCategories();

      if (categories.isEmpty) {
        return Left(CacheFailure(errorMessage: 'We Found Empty Categories'));
      }

      return Right(categories);
    } catch (e) {
      return Left(CacheFailure(errorMessage: e.toString()));
    }
  }
}

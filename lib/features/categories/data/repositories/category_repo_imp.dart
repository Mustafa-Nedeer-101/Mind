import 'package:dartz/dartz.dart';
import 'package:mind/features/categories/data/datasources/categories_local_datasource.dart';
import 'package:mind/features/categories/data/models/category_model.dart';
import 'package:mind/core/errors/exceptions.dart';
import 'package:mind/core/errors/failure.dart';
import '../../business/repositories/category_repo.dart';

class CategoryRepoImp implements CategoryRepo {
  final CategoriesLocalDataSource dataSource;

  CategoryRepoImp({required this.dataSource});
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final List<CategoryModel> categories = await dataSource.getCategories();

      return Right(categories);
    } on CacheException {
      return Left(CacheFailure(errorMessage: 'Cache Exception Occured'));
    } on Exception catch (e) {
      return Left(UnknownFailure(errorMessage: e.toString()));
    }
  }
}

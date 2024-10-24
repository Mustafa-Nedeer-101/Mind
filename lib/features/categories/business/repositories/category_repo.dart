import 'package:dartz/dartz.dart';
import 'package:mind/features/categories/business/enities/category_einity.dart';
import 'package:mind/core/errors/failure.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}

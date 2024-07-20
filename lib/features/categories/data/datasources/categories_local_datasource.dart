import 'package:mind/features/categories/data/models/category_model.dart';
import 'package:mind/core/errors/exceptions.dart';
import 'package:mind/core/helper_classes/database_manager.dart';
import 'package:sqflite/sqflite.dart';

abstract class CategoriesLocalDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoriesLocalDataSourceImp implements CategoriesLocalDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final dbResponse = await DatabaseManager.readDatabase('''
        SELECT * FROM Categories
      ''');

      List<CategoryModel> categories = dbResponse
          .map((cat) => CategoryModel.fromJson(cat as Map<String, dynamic>))
          .toList();

      // Assign each category a number of questions
      for (final category in categories) {
        int cId = category.id;

        List<Map<dynamic, dynamic>> queryResult =
            await DatabaseManager.readDatabase(
                'SELECT COUNT(*) FROM Questions WHERE categoryId = ?', [cId]);

        int? numOfQustions =
            Sqflite.firstIntValue(queryResult as List<Map<String, Object?>>);

        category.numberOfQuestions = numOfQustions ?? 0;
      }

      if (categories.isEmpty) {
        throw CacheException();
      }

      return categories;
    } on Exception {
      rethrow;
    }
  }
}

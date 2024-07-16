import 'package:mind/features/categories/business/enities/category_einity.dart';
import 'package:mind/features/categories/data/models/category_model.dart';
import 'package:mind/utils/errors/exceptions.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../utils/database/database_utility.dart';

abstract class CategoriesLocalDataSource {
  Future<List<CategoryEntity>> getCategories();
}

class CategoriesLocalDataSourceImp implements CategoriesLocalDataSource {
  final UDatabase database;

  CategoriesLocalDataSourceImp({required this.database});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final dbResponse = await database.readDatabase('''
        SELECT * FROM Categories
      ''');

      List<CategoryModel> categories = dbResponse
          .map((cat) => CategoryModel.fromJson(cat as Map<String, dynamic>))
          .toList();

      // Assign each category an number of questions
      for (final category in categories) {
        int cId = category.id;

        List<Map<dynamic, dynamic>> queryResult = await database.readDatabase(
            'SELECT COUNT(*) FROM Questions WHERE categoryId = ?', [cId]);

        int? numOfQustions =
            Sqflite.firstIntValue(queryResult as List<Map<String, Object?>>);

        category.numberOfQuestions = numOfQustions ?? 0;
      }

      return categories;
    } catch (e) {
      throw CacheException();
    }
  }
}

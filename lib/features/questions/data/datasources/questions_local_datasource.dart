import 'package:mind/features/questions/data/models/question_model.dart';
import 'package:mind/core/errors/exceptions.dart';
import '../../../../core/helper_classes/database_manager.dart';

abstract class QuestionsLocalDataSource {
  Future<List<QuestionModel>> getQuestions(
      {required int categoryId,
      required String difficulty,
      required int numOfQ});
}

class QuestionsLocalDataSourceImp implements QuestionsLocalDataSource {
  @override
  Future<List<QuestionModel>> getQuestions(
      {required int categoryId,
      required String difficulty,
      required int numOfQ}) async {
    try {
      final queryResponse = await DatabaseManager.readDatabase('''
        SELECT * FROM Questions
        WHERE categoryId = ? AND difficulty = ?
        ORDER BY RANDOM()
        LIMIT ?
      ''', [categoryId, difficulty, numOfQ]);

      List<QuestionModel> questions = queryResponse
          .map((q) => QuestionModel.fromJson(q as Map<String, dynamic>))
          .toList();

      if (questions.isEmpty) {
        throw CacheException();
      }

      return questions;
    } on Exception {
      rethrow;
    }
  }
}

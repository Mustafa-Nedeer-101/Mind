import 'package:mind/features/questions/data/models/question_model.dart';
import 'package:mind/utils/database/database_utility.dart';
import 'package:mind/utils/errors/exceptions.dart';

abstract class QuestionsLocalDataSource {
  Future<List<QuestionModel>> getQuestions(
      {required int categoryId,
      required String difficulty,
      required int numOfQ});
}

class QuestionsLocalDataSourceImp implements QuestionsLocalDataSource {
  final UDatabase database;

  QuestionsLocalDataSourceImp({required this.database});

  @override
  Future<List<QuestionModel>> getQuestions(
      {required int categoryId,
      required String difficulty,
      required int numOfQ}) async {
    try {
      final queryResponse = await database.readDatabase('''
        SELECT * FROM Questions
        WHERE categoryId = ? AND difficulty = ?
        ORDER BY RANDOM()
        LIMIT ?
      ''', [categoryId, difficulty, numOfQ]);

      List<QuestionModel> questions = queryResponse
          .map((q) => QuestionModel.fromJson(q as Map<String, dynamic>))
          .toList();

      return questions;
    } on CacheException {
      throw CacheException();
    } catch (e) {
      throw e.toString();
    }
  }
}

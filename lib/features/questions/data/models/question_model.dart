import 'dart:convert';
import 'package:mind/features/questions/business/entities/question_entity.dart';

class QuestionModel extends QuestionEntity {
  QuestionModel(
      {required super.difficulty,
      required super.id,
      required super.categoryId,
      super.categoryName,
      required super.question,
      required super.incorrectAnswers,
      required super.correctAnswer});

  // Return a model given a Map
  factory QuestionModel.fromJson(Map<String, dynamic> query) {
    final String incorrectAnswersAsString = query['incorrectAnswers'];

    final List<String> incorrectAnswersAsList =
        incorrectAnswersAsString.split('|');

    return QuestionModel(
        id: query['qId'] ?? 0,
        categoryId: query['categoryId'],
        difficulty: query['difficulty'],
        question: query['question'],
        incorrectAnswers: incorrectAnswersAsList,
        correctAnswer: query['correctAnswer']);
  }

  // Return a model given an API response body
  factory QuestionModel.fromApi(Map<String, dynamic> apiData) {
    return QuestionModel(
      id: 0,
      categoryId: 0,
      categoryName: apiData['categoryName'],
      difficulty: apiData['difficulty'],
      question: apiData['question'],
      incorrectAnswers: List<String>.from(apiData['incorrect_answers']),
      correctAnswer: apiData['correct_answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'qId': id,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'question': question,
      'difficulty': difficulty,
      'incorrectAnswers': json.encode(incorrectAnswers),
      'correctAnswer': correctAnswer,
    };
  }
}

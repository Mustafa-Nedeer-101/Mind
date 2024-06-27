import 'dart:convert';

class QuestionModel {
  final int qId;
  final int categoryId;
  final String question;
  final String difficulty;
  final List<String> incorrectAnswers;
  final String correctAnswer;

  QuestionModel(
      {required this.difficulty,
      required this.qId,
      required this.categoryId,
      required this.question,
      required this.incorrectAnswers,
      required this.correctAnswer});

  // Return a category id given its name
  static int getCategoryId(String categoryName) {
    switch (categoryName) {
      case "Sports":
        return 21;

      default:
        return 0;
    }
  }

  // Return a model given a Map
  factory QuestionModel.fromJson(Map<String, dynamic> query) {
    final String incorrectAnswersAsString = query['incorrectAnswers'];

    final List<String> incorrectAnswersAsList =
        incorrectAnswersAsString.split('|');

    return QuestionModel(
        qId: query['qId'] ?? 0,
        categoryId: query['categoryId'],
        difficulty: query['difficulty'],
        question: query['question'],
        incorrectAnswers: incorrectAnswersAsList,
        correctAnswer: query['correctAnswer']);
  }

  // Return a model given an API response body
  factory QuestionModel.fromApi(Map<String, dynamic> apiData) {
    return QuestionModel(
      qId: 0,
      categoryId: getCategoryId(apiData['category']),
      difficulty: apiData['difficulty'],
      question: apiData['question'],
      incorrectAnswers: List<String>.from(apiData['incorrect_answers']),
      correctAnswer: apiData['correct_answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'qId': qId,
      'categoryId': categoryId,
      'question': question,
      'difficulty': difficulty,
      'incorrectAnswers': json.encode(incorrectAnswers),
      'correctAnswer': correctAnswer,
    };
  }
}

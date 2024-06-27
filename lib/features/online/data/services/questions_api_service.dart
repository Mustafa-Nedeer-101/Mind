import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mind/features/quiz/models/question.dart';

class QuestionsApiService extends GetxController {
  static QuestionsApiService get instance => Get.find();

  // Variables
  final String baseUrl = 'https://opentdb.com/api.php';

  // Return a list of questions according to some settings
  Future<List<QuestionModel>> fetchQuestions(
      {required int amount,
      required int category,
      required String difficulty,
      required String type}) async {
    try {
      final url = Uri.parse(
          '$baseUrl?amount=$amount&category=$category&difficulty=$difficulty&type=$type');

      final response = await http.get(url);

      // Check StatusCode
      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

        // Got response but with empty results
        if (responseJson['response_code'] == 1) return [];

        // Got response with results
        List<dynamic> questions = responseJson['results'];

        return questions
            .map((q) => QuestionModel.fromApi(q as Map<String, dynamic>))
            .toList();
      } else {
        throw "Failed to load questions data!";
      }
    } catch (e) {
      throw 'Error occured: $e';
    }
  }

  // Function to store questions in the database
  void storeDatabase() async {
    for (int i = 0; i < 23; i++) {
      final List<QuestionModel> questions = await fetchQuestions(
          amount: 2, category: i + 9, difficulty: "easy", type: "multiple");

      for (final q in questions) {
        // ignore: avoid_print
        print(q.question);
      }

      await Future.delayed(const Duration(seconds: 5));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/quiz/controllers/audio_controller.dart';
import 'package:mind/features/quiz/controllers/question_controller.dart';
import 'package:mind/features/quiz/controllers/quiz_finish_controller.dart';
import 'package:mind/features/quiz/models/question.dart';
import 'package:mind/routing/routes.dart';
import 'package:mind/utils/database/database_utility.dart';

class QuizController extends GetxController {
  QuizController(
      {required this.categoryId,
      required this.numOfQ,
      required this.difficulty});

  // variables
  final AudioController audioController = Get.put(AudioController());
  RxBool isLoading = true.obs;
  final int categoryId;
  final String categoryName = '';
  final int numOfQ;
  final String difficulty;
  final UDatabase databaseUtility = Get.find();

  List<QuestionModel> questions = [];

  // For particular question
  RxBool questionSolved = false.obs;
  int index = 0;

  // Used by the Progress Indicator
  RxInt questionsSolved = 0.obs;

  // Needed for quiz finish logic
  List<String> questionTexts = [];
  List<List<String>> answers = [];
  List<int> correctIndexes = [];
  List<int> incorrectIndexes = [];

  int correctQuestions = 0;

  // PageView Controller to control the questions pages' scrolls
  PageController pageController = PageController();

  // get Questions in initialization
  @override
  void onInit() async {
    super.onInit(); // It's important to call super.onInit() at the beginning
    fetchData();
  }

  // Start by getting the questions
  void fetchData() async {
    final queryResponse = await databaseUtility.readDatabase('''
      SELECT * FROM Questions
      WHERE categoryId = ? AND difficulty = ?
      LIMIT ?
    ''', [categoryId, difficulty, numOfQ]);

    questions.assignAll(queryResponse
        .map((q) => QuestionModel.fromJson(q as Map<String, dynamic>))
        .toList());

    isLoading.value = false;
  }

  // Function to go to next question
  void nextQuestion() {
    // If quiz finished
    if (index == numOfQ - 1) {
      Get.put(
          QuizFinishController(
              answers: answers,
              numOfCorrectQuestions: correctQuestions,
              questionTexts: questionTexts,
              correctIndexes: correctIndexes,
              incorrectIndexes: incorrectIndexes,
              difficulty: difficulty),
          permanent: true);
      Get.offNamed(Routes.quizFinish)!.then((val) {
        Get.delete<QuizFinishController>(force: true);
      });
      audioController.playCongrats();
    }

    // Only if question Solved
    if (questionSolved.value) {
      index++;
      questionSolved.value = false;
      questionsSolved.value++;

      // Delete Question controller manually
      Get.delete<QuestionController>();

      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}

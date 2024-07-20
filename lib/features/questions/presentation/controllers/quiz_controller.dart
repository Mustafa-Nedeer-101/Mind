import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/questions/business/usecases/get_questions_usecase.dart';
import 'package:mind/features/questions/data/datasources/questions_local_datasource.dart';
import 'package:mind/features/questions/data/repositories/questions_repo_imp.dart';
import 'package:mind/features/questions/presentation/controllers/question_controller.dart';
import 'package:mind/features/questions/presentation/controllers/quiz_finish_controller.dart';
import 'package:mind/core/helper_classes/audio_manager.dart';
import 'package:mind/core/errors/failure.dart';
import '../../../../routing/routes.dart';
import '../../business/entities/question_entity.dart';

class QuizController extends GetxController {
  Failure? failure;
  List<QuestionEntity>? questions;

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

  QuizController(
      {required this.categoryId,
      required this.difficulty,
      required this.numOfQ});

  int categoryId;
  String difficulty;
  int numOfQ;

  @override
  onInit() async {
    super.onInit();

    await eitherFailureOrQuestions(
        categoryId: categoryId, difficulty: difficulty, numOfQ: numOfQ);
  }

  eitherFailureOrQuestions(
      {required int categoryId,
      required String difficulty,
      required int numOfQ}) async {
    final repository =
        QuestionsRepoImp(dataSource: QuestionsLocalDataSourceImp());

    final eitherFailureOrQuestions = await GetQuestionsUsecase(repo: repository)
        .call(categoryId: categoryId, difficulty: difficulty, numOfQ: numOfQ);

    eitherFailureOrQuestions.fold((newFailur) {
      failure = newFailur;
      questions = null;
      update();
    }, (newQuestions) {
      questions = newQuestions;
      this.numOfQ = newQuestions.length;
      failure = null;
      update();
    });
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

      CustomAudioPlayersManager.playCongrats();
    }

    // Only if question Solved
    else if (questionSolved.value) {
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

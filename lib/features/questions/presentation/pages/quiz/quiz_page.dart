import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/questions/presentation/controllers/quiz_controller.dart';
import 'package:mind/features/questions/presentation/pages/quiz/widgets/question_page_failure.dart';
import 'widgets/big_question_page_success.dart';
import 'widgets/small_question_page_success.dart';

class QuizPage extends StatelessWidget {
  final int categoryId;
  final int numOfQ;
  final String difficulty;

  const QuizPage(
      {super.key,
      required this.categoryId,
      required this.numOfQ,
      required this.difficulty});

  @override
  Widget build(BuildContext context) {
    final QuizController quizController = Get.put(QuizController(
        categoryId: categoryId, numOfQ: numOfQ, difficulty: difficulty));

    return GetBuilder<QuizController>(
      builder: (controller) {
        if (controller.questions != null) {
          // Success
          return MediaQuery.of(context).size.height <= 1000
              ? SmallQuestionPageSuccess(
                  quizController: quizController,
                )
              : BigQuestionPageSuccess(
                  quizController: quizController,
                );
        } else if (controller.failure != null) {
          // Failure
          return QuestionPageFailure(controller: controller);
        } else {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

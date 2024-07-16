import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/questions/presentation/controllers/quiz_controller.dart';
import '../widgets/big_question_screen.dart';
import '../widgets/small_question_screen.dart';

class CustomQuizPage extends StatelessWidget {
  final int categoryId;
  final int numOfQ;
  final String difficulty;

  const CustomQuizPage(
      {super.key,
      required this.categoryId,
      required this.numOfQ,
      required this.difficulty});

  @override
  Widget build(BuildContext context) {
    final CustomQuizController quizController = Get.put(CustomQuizController(
        categoryId: categoryId, numOfQ: numOfQ, difficulty: difficulty));

    return Scaffold(
        body: GetBuilder<CustomQuizController>(builder: (controller) {
      if (controller.questions != null) {
        return MediaQuery.of(context).size.height <= 1000
            ? CustomSmallQuestionScreen(
                quizController: quizController,
              )
            : CustomBigQuestionScreen(
                quizController: quizController,
              );
      } else if (controller.failure != null) {
        return Center(
          child: Text('Error: ${controller.failure!.errorMessage}'),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    }));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/questions/presentation/pages/show_questions/widgets/show_big_question.dart';
import 'package:mind/features/questions/presentation/pages/show_questions/widgets/show_small_question.dart';
import 'package:mind/core/constants/sizes.dart';
import '../../controllers/quiz_finish_controller.dart';

class ShowQuestionsPage extends StatelessWidget {
  const ShowQuestionsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final QuizFinishController quizFinishController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Show Questions",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CSizes.sm,
        ),
        child: ListView.builder(
          itemCount: quizFinishController.questionTexts.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: CSizes.spaceBtwSections * 2,
                  ),
                  child: MediaQuery.of(context).size.height <= 1000
                      ? ShowSmallQuestion(
                          questionText:
                              quizFinishController.questionTexts[index],
                          correctAnswerIndex:
                              quizFinishController.correctIndexes[index],
                          incorrectAnswerIndex:
                              quizFinishController.incorrectIndexes[index],
                          answers: quizFinishController.answers[index])
                      : ShowBigQuestion(
                          questionText:
                              quizFinishController.questionTexts[index],
                          correctAnswerIndex:
                              quizFinishController.correctIndexes[index],
                          incorrectAnswerIndex:
                              quizFinishController.incorrectIndexes[index],
                          answers: quizFinishController.answers[index]),
                ),

                // Divider
                if (index != quizFinishController.questionTexts.length - 1)
                  const Column(
                    children: [
                      Divider(),
                      SizedBox(
                        height: CSizes.spaceBtwSections * 2,
                      ),
                    ],
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}

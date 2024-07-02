import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/quiz/controllers/quiz_finish_controller.dart';
import 'package:mind/utils/constants/colors.dart';
import 'package:mind/utils/constants/sizes.dart';

class ShowQuestionsScreen extends StatelessWidget {
  const ShowQuestionsScreen({
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
                  child: QuizQuestion(
                      questionText: quizFinishController.questionTexts[index],
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

//Given a Question
class QuizQuestion extends StatelessWidget {
  const QuizQuestion(
      {super.key,
      required this.questionText,
      required this.correctAnswerIndex,
      required this.incorrectAnswerIndex,
      required this.answers});

  final String questionText;
  final List<String> answers;
  final int correctAnswerIndex;
  final int incorrectAnswerIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Question Text
        Container(
          padding: const EdgeInsets.only(
              left: CSizes.md,
              right: CSizes.md,
              bottom: CSizes.md,
              top: CSizes.spaceBtwSections),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CSizes.md),
              color: CColors.darkerGrey),
          child: Column(children: [
            Text(
              questionText,
              style: const TextStyle(color: CColors.white, fontSize: 20.0),
            ),

            const SizedBox(
              height: CSizes.spaceBtwSections,
            ),

            // Anwsers ListView
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: answers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(CSizes.md),
                      border: Border.all(
                        color: index == correctAnswerIndex
                            ? Colors.green
                            : index == incorrectAnswerIndex
                                ? Colors.red
                                : Colors.grey[800]!,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 12.0),
                    child: Row(
                      children: [
                        Text(
                          answers[index],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16.0),
                        ),
                        const Spacer(),
                        if (correctAnswerIndex != -1)
                          Icon(
                            index == correctAnswerIndex
                                ? Icons.check
                                : index == incorrectAnswerIndex
                                    ? Icons.close
                                    : null,
                            color: index == correctAnswerIndex
                                ? Colors.green
                                : index == incorrectAnswerIndex
                                    ? Colors.red
                                    : Colors.grey[800]!,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ]),
        ),
      ],
    );
  }
}

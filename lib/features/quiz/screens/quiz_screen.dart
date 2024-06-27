import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/quiz/controllers/question_controller.dart';
import 'package:mind/features/quiz/controllers/quiz_controller.dart';
import 'package:mind/features/quiz/models/question.dart';
import 'package:mind/utils/constants/colors.dart';
import 'package:mind/utils/constants/sizes.dart';

class QuizScreen extends StatelessWidget {
  final int categoryId;
  final int numOfQ;
  final String difficulty;

  const QuizScreen(
      {super.key,
      required this.categoryId,
      required this.numOfQ,
      required this.difficulty});

  @override
  Widget build(BuildContext context) {
    final QuizController quizController = Get.put(QuizController(
        categoryId: categoryId, numOfQ: numOfQ, difficulty: difficulty));

    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (quizController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(CSizes.defaultSpace),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Progress Indicator Row
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Close icon
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Padding(
                              padding:
                                  EdgeInsets.only(right: CSizes.spaceBtwItems),
                              child: Icon(Icons.close)),
                        ),

                        // Progress Indicator
                        Obx(
                          () => Expanded(
                            child: LinearProgressIndicator(
                              minHeight: 5,
                              borderRadius: BorderRadius.circular(CSizes.sm),
                              value: quizController.questionsSolved.value /
                                  quizController.questions.length,
                              color: CColors.secondary,
                              backgroundColor: CColors.darkGrey,
                            ),
                          ),
                        ),

                        // Fraction
                        Padding(
                          padding:
                              const EdgeInsets.only(left: CSizes.spaceBtwItems),
                          child: Obx(
                            () => Text(
                              '${quizController.questionsSolved.value}/${quizController.questions.length}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ]),

                  const SizedBox(height: CSizes.appBarHeight),

                  // QuizQuestion
                  Expanded(
                    child: PageView.builder(
                      itemCount: quizController.questions.length,
                      itemBuilder: (context, index) {
                        return QuizQuestion(
                          question: quizController.questions[index],
                        );
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      controller: quizController.pageController,
                    ),
                  ),

                  const SizedBox(height: 16.0),
                  Obx(
                    () => ElevatedButton(
                      onPressed: quizController.nextQuestion,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: quizController.questionSolved.value
                              ? CColors.primary
                              : CColors.darkerGrey,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          side: BorderSide.none),
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ]),
          );
        }),
      ),
    );
  }
}

// Given a Question Model
class QuizQuestion extends StatelessWidget {
  const QuizQuestion({super.key, required this.question});

  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    final QuestionController questionController =
        Get.put(QuestionController(question: question));

    return Column(
      children: [
        // Question Text
        Container(
          padding: const EdgeInsets.only(
              left: CSizes.md,
              right: CSizes.md,
              bottom: CSizes.md,
              top: CSizes.spaceBtwSections),
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CSizes.md),
              color: CColors.darkerGrey),
          child: Text(
            question.question,
            style: const TextStyle(color: CColors.white, fontSize: 20.0),
          ),
        ),

        const SizedBox(
          height: CSizes.spaceBtwSections,
        ),

        // Anwsers ListView
        Expanded(
          child: ListView.builder(
            itemCount: questionController.answers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Obx(
                  () => GestureDetector(
                    onTap: () {
                      questionController.evalAnswer(index);
                    },

                    //
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(CSizes.md),
                        border: Border.all(
                          color: index == questionController.correctAnswer.value
                              ? Colors.green
                              : index ==
                                      questionController.incorrectAnswer.value
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
                            questionController.answers[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16.0),
                          ),
                          const Spacer(),
                          if (questionController.correctAnswer.value != -1)
                            Icon(
                              index == questionController.correctAnswer.value
                                  ? Icons.check
                                  : index ==
                                          questionController
                                              .incorrectAnswer.value
                                      ? Icons.close
                                      : null,
                              color: index ==
                                      questionController.correctAnswer.value
                                  ? Colors.green
                                  : index ==
                                          questionController
                                              .incorrectAnswer.value
                                      ? Colors.red
                                      : Colors.grey[800]!,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

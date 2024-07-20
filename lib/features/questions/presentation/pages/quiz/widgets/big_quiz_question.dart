import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../business/entities/question_entity.dart';
import '../../../controllers/question_controller.dart';
import '../../../controllers/quiz_controller.dart';

class BigQuizQuestion extends StatelessWidget {
  const BigQuizQuestion({
    super.key,
    required this.question,
    required this.quizController,
  });

  final QuestionEntity question;
  final QuizController quizController;

  @override
  Widget build(BuildContext context) {
    final QuestionController questionController = Get.put(
      QuestionController(
        question: question,
        quizController: quizController,
      ),
    );

    return Column(
      children: [
        // Question Text
        Container(
          padding: const EdgeInsets.all(
            CSizes.defaultSpace,
          ),
          height: 280,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CSizes.md),
              color: CColors.darkerGrey),
          child: Text(
            question.question,
            style: const TextStyle(color: CColors.white, fontSize: 20.0),
          ),
        ),

        SizedBox(
          height: CSizes.lg.h,
        ),

        // Anwsers ListView
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: questionController.answers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                            : index == questionController.incorrectAnswer.value
                                ? Colors.red
                                : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 12.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 11,
                          child: Text(
                            questionController.answers[index],
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Visibility(
                            visible:
                                questionController.correctAnswer.value != -1,
                            child: Icon(
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

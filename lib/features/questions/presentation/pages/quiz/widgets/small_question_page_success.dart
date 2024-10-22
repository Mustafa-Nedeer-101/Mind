import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mind/features/questions/presentation/pages/quiz/widgets/small_quiz_question.dart';
import '../../../../../../core/common/widgets/alert_dialog.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../controllers/quiz_controller.dart';

class SmallQuestionPageSuccess extends StatelessWidget {
  const SmallQuestionPageSuccess({super.key, required this.quizController});

  final QuizController quizController;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        await showDialog(
          context: context,
          builder: (context) => const CustomAlertDialog(),
        );
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(CSizes.sm),
          child: ListView(
            shrinkWrap: true,
            children: [
              // Progress Indicator Row
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // Close icon
                GestureDetector(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => const CustomAlertDialog(),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: CSizes.spaceBtwItems),
                    child: Icon(Icons.close),
                  ),
                ),

                // Progress Indicator
                Obx(
                  () => Expanded(
                    child: LinearProgressIndicator(
                      minHeight: 5,
                      borderRadius: BorderRadius.circular(CSizes.sm),
                      value: quizController.questionsSolved.value /
                          quizController.questions!.length,
                      color: CColors.secondary,
                      backgroundColor: CColors.darkGrey,
                    ),
                  ),
                ),

                // Fraction
                Padding(
                  padding: const EdgeInsets.only(left: CSizes.spaceBtwItems),
                  child: Obx(
                    () => Text(
                      '${quizController.questionsSolved.value}/${quizController.questions!.length}',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 16.0),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ]),

              SizedBox(height: 10.0.h),

              // QuizQuestion
              SizedBox(
                height: 600,
                child: PageView.builder(
                  itemCount: quizController.questions!.length,
                  itemBuilder: (context, index) {
                    return SmallQuizQuestion(
                      question: quizController.questions![index],
                      quizController: quizController,
                    );
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  controller: quizController.pageController,
                ),
              ),

              // Space
              const SizedBox(
                height: 5,
              ),

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
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mind/features/questions/presentation/widgets/big_quiz_question.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

import '../controllers/quiz_controller.dart';

class CustomBigQuestionScreen extends StatelessWidget {
  const CustomBigQuestionScreen({
    super.key,
    required this.quizController,
  });

  final CustomQuizController quizController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: CSizes.sm.h),

          // Progress Indicator Row
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // Close icon
            GestureDetector(
              onTap: () => Get.back(),
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
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ]),

          SizedBox(height: CSizes.lg.h),

          // QuizQuestion
          Expanded(
            child: PageView.builder(
              itemCount: quizController.questions!.length,
              itemBuilder: (context, index) {
                return CustomBigQuizQuestion(
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
            height: 150,
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
    );
  }
}

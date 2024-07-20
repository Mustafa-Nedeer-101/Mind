import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mind/features/questions/presentation/pages/quiz_finish/widgets/score.dart';
import 'package:mind/features/questions/presentation/pages/quiz_finish/widgets/text_button.dart';
import '../../../controllers/quiz_finish_controller.dart';
import '../../show_questions/show_questions_page.dart';
import 'correct_incorrect.dart';

class Results extends StatelessWidget {
  const Results({
    super.key,
    required this.quizFinishController,
  });

  final QuizFinishController quizFinishController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 40.h,
        ),
        SizedBox(
          width: double.infinity,
          child: Image.asset('assets/images/congratulate.png'),
        ),

        // Score
        Score(quizFinishController: quizFinishController),

        SizedBox(
          height: 20.h,
        ),

        const Text(
          "You have successfully completed",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),

        SizedBox(
          height: 15.h,
        ),

        // Correct Incorrect
        CorrectIncorrect(quizFinishController: quizFinishController),

        SizedBox(
          height: 50.h,
        ),

        QuizFinishTextButton(
          onPressed: () => Get.to(() => const ShowQuestionsPage()),
          text: "Show Questions",
        ),

        SizedBox(
          height: 20.h,
        ),

        QuizFinishTextButton(
            onPressed: () => quizFinishController.savePoint(),
            text: 'Save Score'),

        SizedBox(
          height: 20.h,
        ),

        QuizFinishTextButton(
            onPressed: () => quizFinishController.homeScreen(), text: 'Home'),
      ],
    );
  }
}

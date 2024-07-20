import 'package:flutter/material.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../controllers/quiz_finish_controller.dart';

class CorrectIncorrect extends StatelessWidget {
  const CorrectIncorrect({
    super.key,
    required this.quizFinishController,
  });

  final QuizFinishController quizFinishController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Chip(
            elevation: 5.0,
            shadowColor: Colors.black54,
            backgroundColor: CColors.darkerGrey,
            side: BorderSide.none,
            label: Row(
              children: <Widget>[
                const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text("${quizFinishController.numOfCorrectQuestions}  correct"),
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),

        // Space
        const SizedBox(
          width: 20,
        ),

        Chip(
            elevation: 5.0,
            shadowColor: Colors.black54,
            backgroundColor: CColors.darkerGrey,
            side: BorderSide.none,
            label: Row(
              children: <Widget>[
                const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                    "${quizFinishController.numOfIncorrectQuestions} incorrect"),
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
      ],
    );
  }
}

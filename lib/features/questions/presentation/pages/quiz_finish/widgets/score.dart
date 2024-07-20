import 'package:flutter/material.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../controllers/quiz_finish_controller.dart';

class Score extends StatelessWidget {
  const Score({
    super.key,
    required this.quizFinishController,
  });

  final QuizFinishController quizFinishController;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Your Score : ", style: Theme.of(context).textTheme.bodyMedium),
          Text(
            "${quizFinishController.score}",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  color: CColors.primary,
                ),
          ),
        ],
      ),

      // The additional points
      Visibility(
        visible: quizFinishController.getsAdditional,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Space
            const SizedBox(
              width: CSizes.spaceBtwSections,
            ),

            //
            Text("Additional Points : ",
                style: Theme.of(context).textTheme.bodyMedium),
            Text(
              "${quizFinishController.additionalPoints}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 24,
                    color: CColors.primary,
                  ),
            ),
          ],
        ),
      ),
    ]);
  }
}

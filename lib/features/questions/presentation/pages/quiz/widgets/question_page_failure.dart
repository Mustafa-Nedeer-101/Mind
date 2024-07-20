import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind/features/questions/presentation/controllers/quiz_controller.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';

class QuestionPageFailure extends StatelessWidget {
  const QuestionPageFailure({super.key, required this.controller});

  final QuizController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Error Icon
            Icon(
              Icons.error,
              size: CSizes.lg.h,
            ),

            // Space
            SizedBox(
              height: CSizes.spaceBtwItems.h,
            ),

            // Error Explaination
            Text(
              controller.failure!.errorMessage,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: CColors.error),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constants/sizes.dart';

class QuizFinishTextButton extends StatelessWidget {
  const QuizFinishTextButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: CSizes.defaultSpace.w),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

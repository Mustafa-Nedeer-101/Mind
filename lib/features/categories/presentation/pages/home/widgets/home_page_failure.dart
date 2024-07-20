import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind/features/categories/presentation/controllers/home_page_controller.dart';
import 'package:mind/core/constants/colors.dart';
import 'package:mind/core/constants/sizes.dart';

class HomePageFailure extends StatelessWidget {
  const HomePageFailure({super.key, required this.controller});

  final HomeController controller;
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

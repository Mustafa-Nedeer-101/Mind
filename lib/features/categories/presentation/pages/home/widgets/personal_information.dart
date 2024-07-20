import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mind/features/categories/presentation/pages/home/widgets/achievements_sections.dart';
import 'package:mind/features/categories/presentation/pages/home/widgets/name_image_row.dart';
import 'package:mind/core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../user/presentation/controllers/profile_controller.dart';

class CustomPersonalInformation extends StatelessWidget {
  const CustomPersonalInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      if (controller.user != null) {
        return Column(
          children: [
            // Name & Image Section
            NameImageSection(
              profileController: controller,
            ),

            // Space
            SizedBox(
              height: CSizes.spaceBtwInputFields.h,
            ),

            // Achievements Section
            AchievementsSection(profileController: controller),
          ],
        );
      } else if (controller.failure != null) {
        return Center(
          child: Text(
            controller.failure!.errorMessage,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: CColors.error),
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

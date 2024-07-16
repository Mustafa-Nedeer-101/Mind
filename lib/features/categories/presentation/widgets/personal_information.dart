import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mind/features/categories/presentation/widgets/achievements_sections.dart';
import 'package:mind/features/categories/presentation/widgets/name_image_row.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../user/presentation/controllers/profile_controller.dart';

class CustomPersonalInformation extends StatelessWidget {
  const CustomPersonalInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomProfileController>(builder: (controller) {
      if (controller.user != null) {
        return Column(
          children: [
            // Name & Image Section
            CustomNameImageSection(
              user: controller.user!.value,
              profileController: controller,
            ),

            // Space
            SizedBox(
              height: CSizes.spaceBtwInputFields.h,
            ),

            // Achievements Section
            CustomAchievementsSection(profileController: controller),
          ],
        );
      } else if (controller.failure != null) {
        return Text('Error: ${controller.failure!.errorMessage}');
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

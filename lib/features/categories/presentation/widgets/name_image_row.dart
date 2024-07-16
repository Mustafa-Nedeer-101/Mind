import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mind/features/user/business/entities/user_intity.dart';
import '../../../../common/widgets/circular_image.dart';
import '../../../user/presentation/controllers/profile_controller.dart';
import '../../../user/presentation/pages/profile_page.dart';

class CustomNameImageSection extends StatelessWidget {
  const CustomNameImageSection(
      {super.key, required this.user, required this.profileController});

  final UserEntity user;
  final CustomProfileController profileController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Name
            Obx(
              () => Text("Hi, ${user.name}", //
                  style: Theme.of(context).textTheme.headlineLarge),
            ),

            const Text("Let's make the day productive",
                overflow: TextOverflow.ellipsis),
          ],
        ),

        // Profile Image
        GestureDetector(
          onTap: () {
            Get.to(() => const CustomProfilePage());
          },
          child: Obx(
            () => CustomCircularImage(
                image: profileController.user!.value.image.value,
                height: 60.w,
                width: 60.w),
          ),
        ),
      ],
    );
  }
}

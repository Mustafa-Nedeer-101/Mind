import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:mind/features/user/business/entities/user_intity.dart';
import 'package:mind/utils/constants/sizes.dart';
import '../../../../common/widgets/circular_image.dart';
import '../controllers/profile_controller.dart';

class CustomProfileImage extends StatelessWidget {
  final UserEntity user;
  final CustomProfileController profileController;
  const CustomProfileImage(
      {super.key, required this.user, required this.profileController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              profileController
                  .showEnlaredImage(profileController.user!.value.image.value);
            },
            child: Obx(
              () => CustomCircularImage(
                width: 80,
                height: 80,
                image: profileController.user!.value.image.value,
              ),
            ),
          ),

          // Space
          SizedBox(
            height: CSizes.spaceBtwItems.h,
          ),

          // change image
          TextButton(
              onPressed: () async {
                profileController.changeImage();
              },
              child: const Text("Change Profile Picture")),
        ],
      ),
    );
  }
}

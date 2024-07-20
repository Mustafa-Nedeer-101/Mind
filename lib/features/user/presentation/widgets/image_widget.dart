import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mind/features/user/business/entities/user_intity.dart';
import 'package:mind/core/constants/sizes.dart';
import '../../../../core/common/widgets/circular_image.dart';
import '../controllers/profile_controller.dart';

class ProfileImage extends StatelessWidget {
  final UserEntity user;
  final ProfileController profileController;
  const ProfileImage(
      {super.key, required this.user, required this.profileController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              profileController
                  .showEnlaredImage(profileController.user!.value.image.value);
            },
            child: Obx(
              () => CustomCircularImage(
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

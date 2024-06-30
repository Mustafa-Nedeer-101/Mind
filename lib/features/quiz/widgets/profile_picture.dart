import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mind/features/quiz/controllers/profile_screen_controller.dart';
import 'package:mind/features/quiz/widgets/circular_image.dart';
import 'package:mind/utils/constants/sizes.dart';

class ProfilePictureSection extends StatelessWidget {
  const ProfilePictureSection({super.key});

  @override
  Widget build(BuildContext context) {
    // The Profile Controller
    final ProfileController profileController = Get.find();

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          // Circular Image
          Obx(() {
            if (profileController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return GestureDetector(
              onTap: () => profileController
                  .showEnlaredImage(profileController.userImage.value),
              child: CustomCircularImage(
                width: 80,
                height: 80,
                image: profileController.userImage.value,
              ),
            );
          }),

          const SizedBox(
            height: CSizes.spaceBtwItems,
          ),

          // change image
          TextButton(
              onPressed: () async {
                await profileController.changeUserImage();
              },
              child: const Text("Change Profile Picture"))
        ],
      ),
    );
  }
}

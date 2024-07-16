import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mind/features/user/presentation/controllers/profile_controller.dart';
import 'package:mind/features/user/presentation/widgets/image_widget.dart';
import 'package:mind/features/user/presentation/widgets/name_widget.dart';
import 'package:mind/features/user/presentation/widgets/options_widget.dart';

import '../../../../common/texts/section_loader.dart';
import '../../../../utils/constants/sizes.dart';

class CustomProfilePage extends StatelessWidget {
  const CustomProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomProfileController>(
      builder: (profileController) {
        if (profileController.user != null) {
          return Scaffold(
            // body
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: CSizes.defaultSpace,
                    right: CSizes.defaultSpace,
                    top: CSizes.defaultSpace.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // AppBar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () => Get.back(),
                              child: const Icon(Icons.arrow_back)),
                        ],
                      ),

                      // Profile Picture Section
                      CustomProfileImage(
                        user: profileController.user!.value,
                        profileController: profileController,
                      ),

                      const SizedBox(
                        height: CSizes.spaceBtwItems / 2,
                      ),

                      // Divider
                      const Divider(),

                      const SizedBox(
                        height: CSizes.spaceBtwItems,
                      ),

                      // Your Information
                      const CustomSectionHeader(
                        title: "Your Information",
                        showActionButton: false,
                      ),

                      const SizedBox(
                        height: CSizes.spaceBtwItems,
                      ),

                      // Name
                      CustomUserName(profileController: profileController),

                      const SizedBox(
                        height: CSizes.spaceBtwItems,
                      ),

                      const Divider(),

                      const SizedBox(
                        height: CSizes.spaceBtwItems,
                      ),

                      // Options
                      const CustomSectionHeader(
                        title: "Options",
                        showActionButton: false,
                      ),

                      const SizedBox(
                        height: CSizes.spaceBtwItems,
                      ),

                      // Enable Disable options
                      CustomOptions(
                          user: profileController.user!.value,
                          profileController: profileController),

                      const SizedBox(
                        height: CSizes.spaceBtwSections * 1.5,
                      ),

                      //
                    ]),
              ),
            ),
          );
        } else if (profileController.failure != null) {
          return Scaffold(
            body: Center(
              child: Text(
                'Error: ${profileController.failure?.errorMessage}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

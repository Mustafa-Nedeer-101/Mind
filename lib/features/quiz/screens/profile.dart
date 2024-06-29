import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';
import 'package:mind/common/texts/section_loader.dart';
import 'package:mind/features/quiz/widgets/profile_menu.dart';
import 'package:mind/features/quiz/widgets/profile_picture.dart';
import 'package:mind/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(children: [
            // Profile Picture Section
            const ProfilePictureSection(),

            const SizedBox(
              height: CSizes.spaceBtwItems / 2,
            ),

            // Divider
            const Divider(),
            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),

            // Profile Information
            const CustomSectionHeader(
              title: "Profile Information",
              showActionButton: false,
            ),

            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),

            Obx(
              () => ProfileMenu(
                onPressed: () {},
                title: "Username",
                value: 'Musta',
              ),
            ),

            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),

            const Divider(),

            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),

            // Personal Information
            const CustomSectionHeader(
              title: "Personal Information",
              showActionButton: false,
            ),

            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),

            const Divider(),

            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),

            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Close Acount",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),

            //
          ]),
        ),
      ),
    );
  }
}

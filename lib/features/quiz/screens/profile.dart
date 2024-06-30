import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/common/texts/section_loader.dart';
import 'package:mind/common/widgets/setting_menu_tile.dart';
import 'package:mind/features/quiz/controllers/profile_screen_controller.dart';
import 'package:mind/features/quiz/screens/change_name.dart';
import 'package:mind/features/quiz/widgets/profile_menu.dart';
import 'package:mind/features/quiz/widgets/profile_picture.dart';
import 'package:mind/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();

    return Scaffold(
      appBar: AppBar(),
      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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

            // Your Information
            const CustomSectionHeader(
              title: "Your Information",
              showActionButton: false,
            ),

            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),

            Obx(
              () => ProfileMenu(
                onPressed: () {
                  Get.to(() => const ChangeNameScreen());
                },
                title: "name",
                value: profileController.userName.value,
              ),
            ),

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

            // Enable Background Music
            Obx(
              () => CustomSettingMenuTile(
                icon: Icons.music_note_rounded,
                title: 'Background Music',
                subTitle:
                    'Enable or Disable the ability to play music in the background',
                trailing: Switch(
                    value: profileController.musicEnabled.value,
                    onChanged: profileController.musicEnableDisable),
              ),
            ),

            const SizedBox(
              height: CSizes.spaceBtwItems,
            ),

            // Update Ranking Automatically
            Obx(
              () => CustomSettingMenuTile(
                icon: Icons.star,
                title: 'Update Ranking',
                subTitle:
                    'Automatically update ranking when there is an internet connection.',
                trailing: Switch(
                    value: profileController.updateRanking.value,
                    onChanged: profileController.autoRankingUpdate),
              ),
            ),

            const SizedBox(
              height: CSizes.spaceBtwSections * 1.5,
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

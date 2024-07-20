import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:mind/features/user/business/entities/user_intity.dart';
import '../../../../core/common/widgets/setting_menu_tile.dart';
import '../../../../core/constants/sizes.dart';
import '../controllers/profile_controller.dart';

class Options extends StatelessWidget {
  final UserEntity user;
  final ProfileController profileController;
  const Options(
      {super.key, required this.user, required this.profileController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Enable Background Music
        Obx(
          () => CustomSettingMenuTile(
            icon: Icons.music_note_rounded,
            title: 'Background Music',
            subTitle:
                'Enable or Disable the ability to play music in the background',
            trailing: Switch(
                value: profileController.user!.value.musicEnabled.value,
                onChanged: (val) {
                  profileController.enableDisableMusic(val);
                }),
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
                value: profileController.user!.value.rankingUpdate.value,
                onChanged: (val) {
                  profileController.enableDisableRanking(val);
                }),
          ),
        ),
      ],
    );
  }
}

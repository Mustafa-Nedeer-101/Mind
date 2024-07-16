import 'package:flutter/widgets.dart';
import 'package:mind/features/categories/presentation/widgets/achievements_column.dart';
import 'package:mind/features/categories/presentation/widgets/achivements_row.dart';
import 'package:mind/features/user/presentation/controllers/profile_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class CustomAchievementsSection extends StatelessWidget {
  const CustomAchievementsSection({super.key, required this.profileController});

  final CustomProfileController profileController;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(CSizes.md),
        decoration: BoxDecoration(
          color: CColors.darkerGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: MediaQuery.of(context).size.width <= 300
            ? CustomAchievementsColumn(
                profileController: profileController,
              )
            : CustomAchievementsRow(
                profileController: profileController,
              ));
  }
}

import 'package:flutter/widgets.dart';
import 'package:mind/features/categories/presentation/pages/home/widgets/achievements_column.dart';
import 'package:mind/features/categories/presentation/pages/home/widgets/achivements_row.dart';
import 'package:mind/features/user/presentation/controllers/profile_controller.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key, required this.profileController});

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(CSizes.md),
        decoration: BoxDecoration(
          color: CColors.darkerGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: MediaQuery.of(context).size.width < 360
            ? AchievementsColumn(
                profileController: profileController,
              )
            : AchievementsRow(
                profileController: profileController,
              ));
  }
}

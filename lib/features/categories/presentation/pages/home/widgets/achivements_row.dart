import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mind/features/user/presentation/controllers/profile_controller.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/images.dart';
import '../../../../../../core/constants/sizes.dart';

class AchievementsRow extends StatelessWidget {
  const AchievementsRow({
    super.key,
    required this.profileController,
  });

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Ranking Half
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.4,
          child: Row(
            children: [
              // Prize Icon
              Expanded(
                child: Image(
                  image: const AssetImage(CImages.trophyIcon),
                  width: 50.w,
                  height: 50.h,
                ),
              ),

              const SizedBox(
                width: CSizes.sm,
              ),

              // Ranking
              Obx(
                () => Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ranking",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        profileController.user!.value.ranking.value.isEmpty
                            ? 'Not Determined'
                            : profileController.user!.value.ranking.value, //
                        style: const TextStyle(
                            color: CColors.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

        // Points Half
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.4,
          child: Row(
            children: [
              // Points Icon
              Expanded(
                flex: 1,
                child: Image(
                  image: const AssetImage(CImages.coinIcon),
                  width: 50.w,
                  height: 50.h,
                ),
              ),

              const SizedBox(
                width: (CSizes.sm),
              ),

              // Points
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Points",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      "${profileController.user!.value.points.value}",
                      style: const TextStyle(
                          color: CColors.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

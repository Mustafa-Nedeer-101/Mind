import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mind/features/user/presentation/controllers/profile_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';

class CustomAchievementsRow extends StatelessWidget {
  const CustomAchievementsRow({
    super.key,
    required this.profileController,
  });

  final CustomProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Ranking Half
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.5,
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

              SizedBox(
                width: CSizes.sm.w,
              ),

              // Ranking
              Obx(
                () => Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ranking",
                        style: Theme.of(context).textTheme.bodyLarge,
                        overflow: TextOverflow.clip,
                      ),
                      Text(
                        profileController.user!.value.ranking.value.isEmpty
                            ? 'Not Determined'
                            : profileController.user!.value.ranking.value, //
                        style: const TextStyle(
                            color: CColors.primary,
                            overflow: TextOverflow.ellipsis,
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

        // Divider
        VerticalDivider(
          width: 1.w,
          color: CColors.darkGrey,
        ),

        // Points Hald
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.5,
          child: Row(
            children: [
              // Points Icon
              Expanded(
                child: Image(
                  image: const AssetImage(CImages.coinIcon),
                  width: 50.w,
                  height: 50.h,
                ),
              ),

              SizedBox(
                width: (CSizes.sm).w,
              ),

              // Points
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Points",
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.clip,
                    ),
                    Text(
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

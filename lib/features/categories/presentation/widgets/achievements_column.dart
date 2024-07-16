import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../user/presentation/controllers/profile_controller.dart';

class CustomAchievementsColumn extends StatelessWidget {
  const CustomAchievementsColumn({
    super.key,
    required this.profileController,
  });

  final CustomProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Ranking Half
        Padding(
          padding: EdgeInsets.symmetric(vertical: CSizes.sm.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Prize Icon
              Expanded(
                flex: 1,
                child: Image(
                  image: const AssetImage(CImages.trophyIcon),
                  width: 50.w,
                  height: 50.h,
                ),
              ),

              SizedBox(
                width: CSizes.spaceBtwSections.w,
              ),

              // Ranking
              Obx(
                () => Expanded(
                  flex: 4,
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
                            : profileController.user!.value.ranking.value,
                        style: TextStyle(
                            color: CColors.primary,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

        Divider(
          color: CColors.darkGrey,
          height: 1.h,
        ),

        // Points Half
        Padding(
          padding: EdgeInsets.symmetric(vertical: CSizes.sm.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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

              SizedBox(
                width: CSizes.spaceBtwSections.w,
              ),

              // Points
              Expanded(
                flex: 4,
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
                      style: TextStyle(
                          color: CColors.primary,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

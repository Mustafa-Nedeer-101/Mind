import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mind/features/quiz/widgets/category_card.dart';
import 'package:mind/features/quiz/widgets/circular_image.dart';
import 'package:mind/features/quiz/widgets/quiz_setting.dart';

import 'package:mind/utils/constants/colors.dart';
import 'package:mind/utils/constants/images.dart';
import 'package:mind/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: CSizes.appBarHeight,
            left: CSizes.defaultSpace,
            right: CSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, User",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const Text(
                      "Let's make the day productive",
                    ),
                  ],
                ),

                // Profile Image
                const CustomCircularImage(
                  image: '',
                  height: 65,
                  width: 65,
                ),
              ],
            ),

            // Space
            const SizedBox(
              height: CSizes.spaceBtwInputFields,
            ),

            // Rank Section
            const RankSection(ranking: 384, points: 1209),

            // Space
            const SizedBox(
              height: CSizes.spaceBtwInputFields,
            ),

            // Let's Play
            Text(
              "Let's play",
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(
              height: CSizes.spaceBtwInputFields,
            ),

            // Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: CSizes.defaultSpace,
                mainAxisSpacing: CSizes.lg,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        const QuizSettingsBottomSheet(
                          title: 'Sports',
                        ),
                        isScrollControlled: true,
                      );
                    },
                    child: const CustomCategoryCard(
                      category: 'Sports',
                      numOfQ: 35,
                      imageString: CImages.sports,
                    ),
                  ),
                  const CustomCategoryCard(
                    category: 'Sports',
                    numOfQ: 35,
                    imageString: CImages.animals,
                  ),
                  const CustomCategoryCard(
                    category: 'Sports',
                    numOfQ: 35,
                    imageString: CImages.boilogy,
                  ),
                  const CustomCategoryCard(
                    category: 'Sports',
                    numOfQ: 35,
                    imageString: CImages.art,
                  ),
                  const CustomCategoryCard(
                    category: 'Sports',
                    numOfQ: 35,
                    imageString: CImages.computers,
                  ),
                  const CustomCategoryCard(
                    category: 'Sports',
                    numOfQ: 35,
                    imageString: CImages.general,
                  ),
                  const CustomCategoryCard(
                    category: 'Sports',
                    numOfQ: 35,
                    imageString: CImages.chemistry,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Rank
class RankSection extends StatelessWidget {
  const RankSection({super.key, required this.ranking, required this.points});

  final int ranking;
  final int points;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CSizes.md),
      decoration: BoxDecoration(
        color: CColors.darkerGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                // Prize Icon
                const Image(
                  image: AssetImage(CImages.trophyIcon),
                  width: 50,
                  height: 50,
                ),

                const SizedBox(
                  width: CSizes.sm,
                ),

                // Ranking
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ranking",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "$ranking",
                      style: const TextStyle(
                          color: CColors.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),

          // Divider
          Container(
            height: 60,
            width: 1,
            color: CColors.darkGrey,
          ),
          //
          Expanded(
            child: Row(
              children: [
                const SizedBox(
                  width: CSizes.md,
                ),

                // Points Icon
                const Image(
                  image: AssetImage(CImages.coinIcon),
                  width: 50,
                  height: 50,
                ),

                const SizedBox(
                  width: CSizes.sm,
                ),

                // Points
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Points",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "$points",
                      style: const TextStyle(
                          color: CColors.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

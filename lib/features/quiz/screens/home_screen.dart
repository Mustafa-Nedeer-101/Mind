import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/quiz/controllers/home_controller.dart';
import 'package:mind/features/quiz/screens/profile_screen.dart';
import 'package:mind/features/quiz/widgets/category_card.dart';
import 'package:mind/features/quiz/widgets/circular_image.dart';
import 'package:mind/features/quiz/widgets/quiz_setting.dart';
import 'package:mind/utils/audio/background_audio_utility.dart';
import 'package:mind/utils/constants/colors.dart';
import 'package:mind/utils/constants/images.dart';
import 'package:mind/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    BackgroundMusicController.playRandomSong();

    return Scaffold(
      body: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.only(
              top: CSizes.lg, left: CSizes.sm, right: CSizes.sm),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // AppBar Space
                  const SizedBox(
                    height: CSizes.defaultSpace,
                  ),

                  // Profile Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, ${homeController.user.value.uName}",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const Text(
                            "Let's make the day productive",
                          ),
                        ],
                      ),

                      // Profile Image
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const ProfileScreen());
                        },
                        child: CustomCircularImage(
                          image: homeController.user.value.userImage,
                          height: 65,
                          width: 65,
                        ),
                      ),
                    ],
                  ),

                  // Space
                  const SizedBox(
                    height: CSizes.spaceBtwInputFields,
                  ),

                  // Rank Section
                  RankSection(
                      ranking: homeController.ranking.value != 0
                          ? homeController.ranking.value
                          : homeController.user.value.ranking,
                      points: homeController.user.value.points),

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
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: homeController.categories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: CSizes.defaultSpace,
                      mainAxisSpacing: CSizes.lg,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            QuizSettingsBottomSheet(
                              title: 'Sports',
                              categoryId: homeController.categories[index].cId,
                            ),
                            isScrollControlled: true,
                          );
                        },
                        child: CustomCategoryCard(
                          category: homeController.categories[index].cName,
                          getNumQ: homeController.getNumOfQuestions(
                              homeController.categories[index].cId),
                          imageString: homeController.categories[index].cImage,
                        ),
                      );
                    },
                  ),
                ]),
          ),
        );
      }),
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

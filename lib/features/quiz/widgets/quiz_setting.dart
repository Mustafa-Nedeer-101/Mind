import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/quiz/controllers/quiz_settings_controller.dart';
import 'package:mind/utils/audio/background_audio_utility.dart';
import 'package:mind/utils/constants/colors.dart';
import 'package:mind/utils/constants/sizes.dart';

class QuizSettingsBottomSheet extends StatelessWidget {
  const QuizSettingsBottomSheet(
      {super.key, required this.title, required this.categoryId});

  final String title;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    // Stop Music
    BackgroundMusicController.stopMusic();

    // Controller
    final QuizSettingsController controller = Get.put(QuizSettingsController());

    // Set CategoryId
    controller.selectedCategory = categoryId;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(CSizes.defaultSpace),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(CSizes.md),
              topRight: Radius.circular(CSizes.md)),
          color: CColors.darkerGrey),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Category Name
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: CSizes.spaceBtwSections,
          ),

          // Number of questions
          SizedBox(
            width: double.infinity,
            child: Text(
              'Select Total Number of Questions',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),

          const SizedBox(
            height: CSizes.spaceBtwInputFields,
          ),

          Obx(() {
            return Wrap(
              spacing: 10,
              children: [5, 10, 15, 20, 25]
                  .map(
                    (number) => ChoiceChip(
                      label: Text(number.toString()),
                      selected: controller.selectedQuestions.value == number,
                      onSelected: (selected) {
                        controller.setQuestions(number);
                      },
                    ),
                  )
                  .toList(),
            );
          }),

          const SizedBox(
            height: CSizes.spaceBtwSections,
          ),

          // Difficulty level
          SizedBox(
            width: double.infinity,
            child: Text(
              'Select Difficulty',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),

          const SizedBox(
            height: CSizes.spaceBtwInputFields,
          ),

          Obx(() {
            return Wrap(
              spacing: 10,
              children: ['Easy', 'Medium', 'Hard']
                  .map(
                    (level) => ChoiceChip(
                      label: Text(level),
                      selected: controller.selectedDifficulty.value == level,
                      onSelected: (value) {
                        controller.setDifficulty(level);
                      },
                    ),
                  )
                  .toList(),
            );
          }),

          const SizedBox(
            height: CSizes.appBarHeight,
          ),

          //Start quiz button
          ElevatedButton(
            onPressed: () async {
              controller.startQuiz();
            },
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: CSizes.md),
                child: Text("Start Quiz")),
          ),
        ],
      ),
    );
  }
}

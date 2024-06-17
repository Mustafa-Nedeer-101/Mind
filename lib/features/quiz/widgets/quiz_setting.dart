import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/quiz/controllers/quiz_settings_controller.dart';
import 'package:mind/features/quiz/screens/quiz_screen.dart';
import 'package:mind/utils/constants/colors.dart';
import 'package:mind/utils/constants/sizes.dart';

class QuizSettingsBottomSheet extends StatelessWidget {
  const QuizSettingsBottomSheet({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final QuizSettingsController controller = Get.put(QuizSettingsController());
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
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: CSizes.spaceBtwSections,
          ),

          // Number of questions
          Text(
            'Select Total Number of Questions',
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          const SizedBox(
            height: CSizes.spaceBtwInputFields,
          ),
          Obx(() {
            return Wrap(
              spacing: 10,
              children: [10, 20, 30, 40, 50]
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
          Text(
            'Select Difficulty',
            style: Theme.of(context).textTheme.bodyLarge,
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
            onPressed: () {
              Get.off(
                () => QuizScreen(
                  currentQuestionNumber: 5,
                  totalQuestions: 10,
                  question:
                      'What is the most popular sport throughout the world?',
                  options: const [
                    'Volleyball',
                    'Football',
                    'Basketball',
                    'Badminton'
                  ],
                  selectedOptionIndex: 2,
                  onOptionSelected: (index) {
                    // Handle option selected
                  },
                  onNext: () {
                    // Handle next button press
                  },
                ),
              );
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

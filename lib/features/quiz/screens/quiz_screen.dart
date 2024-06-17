import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mind/features/quiz/screens/quiz_stats_screen.dart';
import 'package:mind/utils/constants/colors.dart';
import 'package:mind/utils/constants/sizes.dart';

class QuizScreen extends StatelessWidget {
  final int currentQuestionNumber;
  final int totalQuestions;
  final String question;
  final List<String> options;
  final int selectedOptionIndex;
  final Function(int) onOptionSelected;
  final Function onNext;

  const QuizScreen({
    super.key,
    required this.currentQuestionNumber,
    required this.totalQuestions,
    required this.question,
    required this.options,
    required this.selectedOptionIndex,
    required this.onOptionSelected,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Progress Indicator Row
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Padding(
                      padding: EdgeInsets.only(right: CSizes.spaceBtwItems),
                      child: Icon(Icons.close)),
                ),

                Expanded(
                  child: LinearProgressIndicator(
                    minHeight: 5,
                    borderRadius: BorderRadius.circular(CSizes.sm),
                    value: currentQuestionNumber / totalQuestions,
                    color: CColors.secondary,
                    backgroundColor: CColors.darkGrey,
                  ),
                ),

                //
                Padding(
                  padding: const EdgeInsets.only(left: CSizes.spaceBtwItems),
                  child: Text(
                    '$currentQuestionNumber/$totalQuestions',
                    style: const TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.right,
                  ),
                ),
              ]),

              const SizedBox(height: CSizes.appBarHeight),

              // Question Area
              Container(
                padding: const EdgeInsets.only(
                    left: CSizes.md,
                    right: CSizes.md,
                    bottom: CSizes.md,
                    top: CSizes.spaceBtwSections),
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(CSizes.md),
                    color: CColors.darkerGrey),
                child: Text(
                  question,
                  style: const TextStyle(color: CColors.white, fontSize: 20.0),
                ),
              ),

              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GestureDetector(
                        onTap: () => onOptionSelected(index),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(CSizes.md),
                            border: Border.all(
                              color: selectedOptionIndex == index
                                  ? (index == 1 ? Colors.green : Colors.red)
                                  : Colors.grey[800]!,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 12.0),
                          child: Row(
                            children: [
                              Text(
                                options[index],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              const Spacer(),
                              if (selectedOptionIndex == index)
                                Icon(
                                  index == 1 ? Icons.check : Icons.close,
                                  color: index == 1 ? Colors.green : Colors.red,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => Get.off(() => QuizFinishPage(
                    title: '', answer: const {}, listQuestion: const [])),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

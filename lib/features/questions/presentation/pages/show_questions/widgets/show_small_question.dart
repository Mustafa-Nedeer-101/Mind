import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';

class ShowSmallQuestion extends StatelessWidget {
  const ShowSmallQuestion(
      {super.key,
      required this.questionText,
      required this.correctAnswerIndex,
      required this.incorrectAnswerIndex,
      required this.answers});

  final String questionText;
  final List<String> answers;
  final int correctAnswerIndex;
  final int incorrectAnswerIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Question Text
        Container(
          padding: const EdgeInsets.all(CSizes.md),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CSizes.md),
              color: CColors.darkerGrey),
          child: Column(children: [
            Text(
              questionText,
              style: const TextStyle(color: CColors.white, fontSize: 20.0),
            ),

            const SizedBox(
              height: CSizes.spaceBtwSections,
            ),

            // Anwsers ListView
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: answers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(CSizes.sm),
                      border: Border.all(
                        color: index == correctAnswerIndex
                            ? Colors.green
                            : index == incorrectAnswerIndex
                                ? Colors.red
                                : Colors.grey[800]!,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 11,
                          child: Text(
                            answers[index],
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Visibility(
                            visible: (index == correctAnswerIndex ||
                                index == incorrectAnswerIndex),
                            child: Icon(
                              index == correctAnswerIndex
                                  ? Icons.check
                                  : index == incorrectAnswerIndex
                                      ? Icons.close
                                      : null,
                              color: index == correctAnswerIndex
                                  ? Colors.green
                                  : index == incorrectAnswerIndex
                                      ? Colors.red
                                      : Colors.grey[800]!,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ]),
        ),
      ],
    );
  }
}

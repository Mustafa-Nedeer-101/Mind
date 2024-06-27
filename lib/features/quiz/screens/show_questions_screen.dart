import 'package:flutter/material.dart';
import 'package:mind/utils/constants/sizes.dart';

class ShowQuestionsScreen extends StatelessWidget {
  const ShowQuestionsScreen(
      {super.key,
      required this.questions,
      required this.answers,
      required this.correctAnswers});

  final List<String> questions;
  final List<String> answers;
  final List<String> correctAnswers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Show Questions",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CSizes.sm),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(CSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      questions[index],
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: CSizes.spaceBtwItems,
                    ),
                    answers[index] == correctAnswers[index]
                        ? Row(children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Answer:  ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(fontSize: 16)),
                                TextSpan(
                                    text: correctAnswers[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green)),
                              ]),
                            ),
                            const SizedBox(
                              width: CSizes.sm,
                            ),
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          ])
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: 'Answer:  ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(fontSize: 16)),
                                TextSpan(
                                    text: answers[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red)),
                              ])),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Correct:  ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(fontSize: 16)),
                                  TextSpan(
                                      text: correctAnswers[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green)),
                                ]),
                              ),
                            ],
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

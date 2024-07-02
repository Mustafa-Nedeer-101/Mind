import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mind/features/quiz/controllers/quiz_finish_controller.dart';
import 'package:mind/features/quiz/screens/show_questions_screen.dart';
import 'package:mind/utils/constants/colors.dart';
import 'package:mind/utils/constants/sizes.dart';

class QuizFinishScreen extends StatelessWidget {
  final nameController = TextEditingController();

  QuizFinishScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final QuizFinishController quizFinishController = Get.find();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () {
          // Still Loading
          if (quizFinishController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                left: -50,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/ballon2.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),

              Positioned(
                right: 0,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/ballon4.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),

              // Stats
              Positioned(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset('assets/congratulate.png'),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Your Score : ",
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text(
                            "${quizFinishController.score}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 24,
                                  color: CColors.primary,
                                ),
                          ),
                        ],
                      ),

                      // The additional points
                      Visibility(
                        visible: quizFinishController.getsAdditional,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Space
                            const SizedBox(
                              width: CSizes.spaceBtwSections,
                            ),

                            //
                            Text("Additional Points : ",
                                style: Theme.of(context).textTheme.bodyMedium),
                            Text(
                              "${quizFinishController.additionalPoints}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 24,
                                    color: CColors.primary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "You have successfully completed",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    // Correct Incorrect
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Chip(
                            elevation: 5.0,
                            shadowColor: Colors.black54,
                            backgroundColor: CColors.darkerGrey,
                            side: BorderSide.none,
                            label: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    "${quizFinishController.numOfCorrectQuestions}  correct"),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        const SizedBox(
                          width: 20,
                        ),
                        Chip(
                            elevation: 5.0,
                            shadowColor: Colors.black54,
                            backgroundColor: CColors.darkerGrey,
                            side: BorderSide.none,
                            label: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    "${quizFinishController.numOfIncorrectQuestions} incorrect"),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 280,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => const ShowQuestionsScreen());
                        },
                        child: const Text("Show Questions"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 280,
                      child: TextButton(
                        onPressed: () {
                          quizFinishController.savePoint();
                        },
                        child: const Text("Save Score"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 280,
                      child: TextButton(
                        onPressed: () {
                          quizFinishController.homeScreen();
                        },
                        child: const Text("Home"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

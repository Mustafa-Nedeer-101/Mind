import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mind/features/quiz/screens/home_screen.dart';
import 'package:mind/features/quiz/screens/show_questions_screen.dart';
import 'package:mind/utils/constants/colors.dart';

class QuizFinishPage extends StatelessWidget {
  final String title;
  final Map<int, dynamic> answer;
  final List<String> listQuestion;
  final int correct = 0;
  final int incorrect = 0;
  final int score = 0;
  final nameController = TextEditingController();

  QuizFinishPage(
      {super.key,
      required this.title,
      required this.answer,
      required this.listQuestion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            left: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/ballon2.png'), fit: BoxFit.cover),
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
                    image: AssetImage('assets/ballon4.png'), fit: BoxFit.cover),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Your Score : ",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text(
                      "$score",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 24,
                            color: CColors.primary,
                          ),
                    ),
                  ],
                ),
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
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 25),
                ),
                const SizedBox(
                  height: 15,
                ),
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
                            Text("$correct  correct"),
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
                            Text("$incorrect incorrect"),
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
                      Get.to(() => const ShowQuestions(questions: [
                            "What is the most popular sport throughtout the world?"
                          ], answers: [
                            'Basketball'
                          ], correctAnswers: [
                            'Football'
                          ]));
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
                    onPressed: () {},
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
                      Get.offAll(() => const HomeScreen());
                    },
                    child: const Text("Home"),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -60,
            left: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/ballon2.png'), fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            bottom: -60,
            right: -20,
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/ballon4.png'), fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mind/features/questions/presentation/controllers/quiz_finish_controller.dart';
import 'package:mind/features/questions/presentation/pages/quiz_finish/widgets/results.dart';

class QuizFinishPage extends StatelessWidget {
  final nameController = TextEditingController();

  QuizFinishPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final QuizFinishController quizFinishController = Get.find();

    return PopScope(
      canPop: false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                left: -50,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/ballon2.png'),
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
                        image: AssetImage('assets/images/ballon4.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),

              // Results
              Results(quizFinishController: quizFinishController),
            ],
          )),
    );
  }
}

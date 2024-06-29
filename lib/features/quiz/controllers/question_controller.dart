import 'package:get/get.dart';
import 'package:mind/features/quiz/controllers/audio_controller.dart';
import 'package:mind/features/quiz/controllers/quiz_controller.dart';
import 'package:mind/features/quiz/models/question.dart';

class QuestionController extends GetxController {
  QuestionController({required this.question});

  // variables
  final QuizController quizController = Get.find();
  final AudioController audioController = Get.find();

  final QuestionModel question;
  final List<String> answers = [];

  RxInt correctAnswer = (-1).obs;
  RxInt incorrectAnswer = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    shuffleAnswers();
  }

  void shuffleAnswers() {
    // Make Answers
    answers.addAll(question.incorrectAnswers);
    answers.add(question.correctAnswer);

    // Shuffle Answers
    answers.shuffle();
  }

  // Evaluate the chosen answer
  void evalAnswer(int index) {
    // Should make logic based on the given answer
    if (answers[index] == question.correctAnswer) {
      correctAnswer.value = index;

      // play
      audioController.playCorrectAnswer();
    } else {
      correctAnswer.value =
          answers.indexWhere((element) => element == question.correctAnswer);

      incorrectAnswer.value = index;

      // Play
      audioController.playIncorrectAnswer();
    }

    // Mark question as solved
    quizController.questionSolved.value = true;
  }

  //
}

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
    if (!quizController.questionSolved.value) {
      // Should make logic based on the given answer
      if (answers[index] == question.correctAnswer) {
        correctAnswer.value = index;

        // Increment CorrectQuestions by one in quizController
        quizController.correctQuestions++;

        // Add correct indexes to list
        quizController.correctIndexes.add(index);
        quizController.incorrectIndexes.add(-1);

        // play
        audioController.playCorrectAnswer();
      } else {
        correctAnswer.value =
            answers.indexWhere((element) => element == question.correctAnswer);

        incorrectAnswer.value = index;

        // Add correct indexes to list
        quizController.correctIndexes.add(
            answers.indexWhere((answer) => answer == question.correctAnswer));
        quizController.incorrectIndexes.add(index);

        // Play
        audioController.playIncorrectAnswer();
      }

      // Mark question as solved
      quizController.questionSolved.value = true;

      // Add Question text to list
      quizController.questionTexts.add(question.question);

      // Add answers to list
      quizController.answers.add(answers);
    }
  }

  //
}

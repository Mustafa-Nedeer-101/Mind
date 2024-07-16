import 'package:get/get.dart';
import 'package:mind/features/questions/business/entities/question_entity.dart';
import 'package:mind/features/questions/presentation/controllers/quiz_controller.dart';
import 'package:mind/utils/audio/audio_players.dart';

class CustomQuestionController extends GetxController {
  CustomQuestionController({
    required this.question,
    required this.quizController,
  });

  // variables
  final CustomQuizController quizController;

  final QuestionEntity question;
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
        CustomAudioPlayersController.playCorrectAnswer();
      } else {
        correctAnswer.value =
            answers.indexWhere((element) => element == question.correctAnswer);

        incorrectAnswer.value = index;

        // Add correct indexes to list
        quizController.correctIndexes.add(
            answers.indexWhere((answer) => answer == question.correctAnswer));
        quizController.incorrectIndexes.add(index);

        // Play
        CustomAudioPlayersController.playIncorrectAnswer();
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

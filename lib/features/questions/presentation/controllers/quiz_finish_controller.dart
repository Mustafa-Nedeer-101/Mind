import 'package:get/get.dart';
import 'package:mind/core/common/loaders/loaders.dart';
import 'package:mind/features/user/presentation/controllers/profile_controller.dart';
import 'package:mind/core/helper_classes/audio_manager.dart';
import 'package:mind/routing/routes.dart';

class QuizFinishController extends GetxController {
  final List<List<String>> answers;
  final int numOfCorrectQuestions;
  final List<String> questionTexts;
  final String difficulty;
  List<int> correctIndexes;
  List<int> incorrectIndexes;
  QuizFinishController(
      {required this.answers,
      required this.numOfCorrectQuestions,
      required this.questionTexts,
      required this.correctIndexes,
      required this.incorrectIndexes,
      required this.difficulty});

  // variables
  final ProfileController profileController = Get.find();
  bool alreadySaved = false;

  late int additionalPoints = 0;
  late bool getsAdditional = false;
  late int score;
  late int numOfIncorrectQuestions;

  Map<String, int> multipliers = {'easy': 1, 'medium': 3, 'hard': 5};

  @override
  void onInit() {
    super.onInit();

    calculatePoints();
  }

  calculatePoints() {
    // Calculate Additional points
    if (numOfCorrectQuestions == questionTexts.length) {
      int x = multipliers[difficulty] ?? 0;
      int y = questionTexts.length ~/ 5;
      additionalPoints = x * y;
    }

    // check if user gets the points or not
    if (numOfCorrectQuestions == questionTexts.length) {
      getsAdditional = true;
    }

    // Calculate Score
    score = numOfCorrectQuestions;

    // Calculate Incorrect questions
    numOfIncorrectQuestions = questionTexts.length - numOfCorrectQuestions;
  }

  savePoint() async {
    if (!alreadySaved) {
      // Save into Local Storage
      await profileController.addPoints(pointsToAdd: score + additionalPoints);

      alreadySaved = true;
    } else {
      CustomLoaders.customToast(message: 'Already saved your points');
    }
  }

  homeScreen() {
    // Enable Music Again
    CustomAudioPlayersManager.musicEnabled = true;

    // Go to Home Screen
    Get.offAllNamed(Routes.home);

    // Delete the quizFinishController
    Get.delete<QuizFinishController>(force: true);
  }
}

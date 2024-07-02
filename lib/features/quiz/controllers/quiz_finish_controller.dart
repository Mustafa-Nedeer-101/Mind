import 'package:get/get.dart';
import 'package:mind/routing/routes.dart';
import 'package:mind/utils/local_storage/storage_utility.dart';

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
  ULocalStorage storage = ULocalStorage.instance();

  RxBool isLoading = true.obs;
  int additionalPoints = 0;
  bool getsAdditional = false;
  int score = 0;
  int numOfIncorrectQuestions = 0;

  Map<String, int> multipliers = {'easy': 1, 'medium': 3, 'hard': 5};

  @override
  void onInit() async {
    super.onInit();

    calculatePoints();

    isLoading.value = false;
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
  //

  savePoint() async {
    // Read Users and current user
    final List users = await storage.readData('users');

    int oldPoints = users[0]['points'];

    int newPoints = oldPoints + score + additionalPoints;

    users[0]['points'] = newPoints;

    storage.saveData('users', users);

    // Ranking
  }

  homeScreen() {
    // Go to Home Screen
    Get.offAllNamed(Routes.home);

    // Delete the quizFinishController
    Get.delete<QuizFinishController>(force: true);
  }

  updateRanking() async {}
}

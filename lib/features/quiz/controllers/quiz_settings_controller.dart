import 'package:get/get.dart';

class QuizSettingsController extends GetxController {
  var selectedQuestions = 10.obs;
  var selectedDifficulty = 'Easy'.obs;

  void setQuestions(int value) {
    selectedQuestions.value = value;
  }

  void setDifficulty(String value) {
    selectedDifficulty.value = value;
  }
}

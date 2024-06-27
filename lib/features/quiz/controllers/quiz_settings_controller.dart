import 'package:get/get.dart';
import 'package:mind/features/quiz/screens/quiz_screen.dart';

class QuizSettingsController extends GetxController {
  int selectedCategory = 0;
  RxInt selectedQuestions = 5.obs;
  RxString selectedDifficulty = 'Easy'.obs;

  void setQuestions(int value) {
    selectedQuestions.value = value;
  }

  void setDifficulty(String value) {
    selectedDifficulty.value = value;
  }

  void startQuiz() {
    Get.off(() => QuizScreen(
        categoryId: selectedCategory,
        numOfQ: selectedQuestions.value,
        difficulty: selectedDifficulty.value.toLowerCase()));
  }
}

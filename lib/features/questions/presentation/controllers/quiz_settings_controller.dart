import 'package:get/get.dart';
import 'package:mind/core/helper_classes/audio_manager.dart';
import '../../../user/presentation/controllers/profile_controller.dart';
import '../pages/quiz/quiz_page.dart';

class CustomQuizSettingsController extends GetxController {
  int selectedCategory = 0;
  RxInt selectedQuestions = 5.obs;
  RxString selectedDifficulty = 'Easy'.obs;
  final ProfileController profileController = Get.find();

  void setQuestions(int value) {
    selectedQuestions.value = value;
  }

  void setDifficulty(String value) {
    selectedDifficulty.value = value;
  }

  void startQuiz() {
    // Stop Music
    CustomAudioPlayersManager.stopMusic();
    CustomAudioPlayersManager.musicEnabled = false;

    Get.off(() => QuizPage(
        categoryId: selectedCategory,
        numOfQ: selectedQuestions.value,
        difficulty: selectedDifficulty.value.toLowerCase()));
  }
}

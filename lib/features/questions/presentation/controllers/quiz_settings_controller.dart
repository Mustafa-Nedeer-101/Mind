import 'package:get/get.dart';
import 'package:mind/utils/audio/audio_players.dart';

import '../../../user/presentation/controllers/profile_controller.dart';
import '../pages/quiz_page.dart';

class CustomQuizSettingsController extends GetxController {
  int selectedCategory = 0;
  RxInt selectedQuestions = 5.obs;
  RxString selectedDifficulty = 'Easy'.obs;
  final CustomProfileController profileController = Get.find();

  void setQuestions(int value) {
    selectedQuestions.value = value;
  }

  void setDifficulty(String value) {
    selectedDifficulty.value = value;
  }

  void startQuiz() {
    // Stop Music
    CustomAudioPlayersController.stopMusic();
    CustomAudioPlayersController.musicEnabled = false;

    Get.off(() => CustomQuizPage(
        categoryId: selectedCategory,
        numOfQ: selectedQuestions.value,
        difficulty: selectedDifficulty.value.toLowerCase()));
  }
}

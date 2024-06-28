import 'package:audioplayers/audioplayers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AudioController extends GetxController {
  // variables
  final player = AudioPlayer();

  playCorrectAnswer() {
    player.play(AssetSource('audio/correct_answer.mp3'));
  }

  playIncorrectAnswer() {
    player.play(AssetSource('audio/incorrect_answer.mp3'));
  }

  playCongrats() {
    player.play(AssetSource('audio/congrats.mp3'));
  }
}

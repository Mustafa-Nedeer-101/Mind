import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BackgroundMusicController extends GetxController {
  static final AudioPlayer _audioPlayer = AudioPlayer();
  static final List<String> _songs = [
    'audio/background_1.mp3',
    'audio/background_2.mp3',
    'audio/background_3.mp3',
    'audio/background_4.mp3',
    'audio/background_5.mp3',
    'audio/background_6.mp3',
  ];

  @override
  void onInit() {
    super.onInit();
    _audioPlayer.onPlayerComplete.listen((event) {
      // When the current song completes, play the next random song
      playRandomSong();
    });
  }

  // Method to play a random song
  static void playRandomSong() async {
    await Future.delayed(const Duration(seconds: 10));

    final random = Random();
    final songIndex = random.nextInt(_songs.length);
    _audioPlayer.play(AssetSource(_songs[songIndex]), volume: 0.2);
  }

  // Method to stop the music
  static void stopMusic() {
    _audioPlayer.stop();
  }

  // Method to dispose the audio player
  static void disposePlayer() {
    _audioPlayer.dispose();
  }
}

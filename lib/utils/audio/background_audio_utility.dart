import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mind/utils/local_storage/storage_utility.dart';

class BackgroundMusicController extends GetxController {
  // Variables
  static final ULocalStorage storage = ULocalStorage.instance();
  static final AudioPlayer _audioPlayer = AudioPlayer();
  static late bool isMusicEnabled;

  static final List<String> _songs = [
    'audio/background_1.mp3',
    'audio/background_2.mp3',
    'audio/background_3.mp3',
    'audio/background_4.mp3',
    'audio/background_5.mp3',
    'audio/background_6.mp3',
  ];

  @override
  void onInit() async {
    super.onInit();
    await getMusicControls();
    _audioPlayer.onPlayerComplete.listen((event) {
      // When the current song completes, play the next random song
      playRandomSong();
    });
  }

  @override
  void onReady() async {
    super.onReady();
    playRandomSong();
  }

  static Future<void> start() async {
    await getMusicControls();
    _audioPlayer.onPlayerComplete.listen((event) {
      // When the current song completes, play the next random song
      playRandomSong();
    });

    playRandomSong();
  }

  static Future getMusicControls() async {
    isMusicEnabled = await storage.readData('users')[0]['musicEnabled'];
  }

  // Enable Background Music
  static void enableMusic() async {
    final users = await storage.readData('users');
    users[0]['musicEnabled'] = true;
    storage.saveData('users', users);
    isMusicEnabled = true;
    playRandomSong();
  }

  // Disable Backgound Musec
  static void disableMusic() async {
    final users = await storage.readData('users');
    users[0]['musicEnabled'] = false;
    storage.saveData('users', users);
    isMusicEnabled = false;
    stopMusic();
  }

  // Method to play a random song
  static void playRandomSong() async {
    if (isMusicEnabled) {
      await Future.delayed(const Duration(seconds: 10));

      final random = Random();
      final songIndex = random.nextInt(_songs.length);
      _audioPlayer.play(AssetSource(_songs[songIndex]), volume: 0.1);
    }
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

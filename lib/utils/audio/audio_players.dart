import 'dart:math';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CustomAudioPlayersController extends GetxController
    with WidgetsBindingObserver {
  // Variables

  static final AudioPlayer _audioPlayer = AudioPlayer();
  static final AudioPlayer quizPlayer = AudioPlayer();
  static late bool musicEnabled;
  static bool canPlay = true;

  static final List<String> _songs = [
    'audio/background_1.mp3',
    'audio/background_2.mp3',
    'audio/background_3.mp3',
    'audio/background_4.mp3',
    'audio/background_5.mp3',
    'audio/background_6.mp3',
  ];

  static start() async {
    // Listen to background music
    _audioPlayer.onPlayerComplete.listen((event) {
      // When the current song completes, play the next random song
      playRandomSong();
    });

    playRandomSong();

    // Listen to App's Lifecycle to control music
    initialize();
  }

  // Logic For Listening to App's LifeCycle
  static void initialize() {
    WidgetsBinding.instance.addObserver(CustomAudioPlayersController());
  }

  // ignore: unused_field
  static AppLifecycleState? _appLifecycleState;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appLifecycleState = state;
    switch (state) {
      case AppLifecycleState.resumed:
        canPlay = true;
        playRandomSong();
        break;
      case AppLifecycleState.paused:
        canPlay = false;
        stopMusic();
        break;
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.inactive:
    }
  }

  // Method to play a random song
  static void playRandomSong() async {
    if (musicEnabled) {
      await Future.delayed(const Duration(seconds: 5));

      final random = Random();
      final songIndex = random.nextInt(_songs.length);
      if (canPlay) {
        _audioPlayer.play(AssetSource(_songs[songIndex]), volume: 0.1);
      }
    }
  }

  // Method to stop the music
  static void stopMusic() {
    _audioPlayer.stop();
  }

  // Played during quiz
  static void playCorrectAnswer() {
    quizPlayer.play(AssetSource('audio/correct_answer.mp3'));
  }

  static void playIncorrectAnswer() {
    quizPlayer.play(AssetSource('audio/incorrect_answer.mp3'));
  }

  static void playCongrats() {
    quizPlayer.play(AssetSource('audio/congrats.mp3'));
  }

  // Method to dispose the audio player and lifecycle controller
  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.dispose();
    WidgetsBinding.instance.removeObserver(CustomAudioPlayersController());
    super.onClose();
  }
}

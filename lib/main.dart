// ignore_for_file: unused_local_variable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mind/bindings/general_binding.dart';
import 'package:mind/routing/app_routes.dart';
import 'package:mind/utils/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init('Users');

  AudioCache.instance = AudioCache(prefix: 'assets/audio');

  final playerCorrect = AudioPlayer();
  final playerIncorrect = AudioPlayer();
  final playerCongrats = AudioPlayer();
  final playerBackground = AudioPlayer();

  await playerCorrect.setPlayerMode(PlayerMode.lowLatency);
  await playerIncorrect.setPlayerMode(PlayerMode.lowLatency);
  await playerCongrats.setPlayerMode(PlayerMode.lowLatency);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mind',
      theme: CustomAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
    );
  }
}

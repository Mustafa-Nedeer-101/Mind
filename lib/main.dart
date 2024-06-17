import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mind/features/quiz/screens/onboarding_screen.dart';
import 'package:mind/utils/theme/app_theme.dart';

void main() {
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
      home: const OnboardingScreen(),
    );
  }
}

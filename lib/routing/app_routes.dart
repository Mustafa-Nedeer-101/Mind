import 'package:get/get_navigation/get_navigation.dart';
import 'package:mind/features/quiz/screens/home_screen.dart';
import 'package:mind/features/quiz/screens/onboarding_screen.dart';
import 'package:mind/features/quiz/screens/quiz_finish_screen.dart';
import 'package:mind/features/quiz/screens/show_questions_screen.dart';
import 'package:mind/routing/routes.dart';
import 'package:mind/utils/middleware/custom_middleware.dart';

class AppRoutes {
  static final pages = [
    GetPage(
        name: Routes.onboarding,
        page: () => const OnboardingScreen(),
        middlewares: [CustomMiddleware()]),
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.quizFinish, page: () => QuizFinishScreen()),
    GetPage(
        name: Routes.showQuestions, page: () => const ShowQuestionsScreen()),
    GetPage(name: Routes.saveScore, page: () => const HomeScreen()),
  ];
}

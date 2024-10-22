import 'package:get/get_navigation/get_navigation.dart';
import 'package:mind/core/bindings/home_binding.dart';
import 'package:mind/features/categories/presentation/pages/home/home_page.dart';
import 'package:mind/features/questions/presentation/pages/quiz_finish/quiz_finish_page.dart';
import 'package:mind/features/questions/presentation/pages/show_questions/show_questions_page.dart';
import 'package:mind/routing/routes.dart';
import 'package:mind/core/middleware/custom_middleware.dart';
import '../features/user/presentation/pages/onboarding_screen.dart';

class AppRoutes {
  static final pages = [
    GetPage(
        name: Routes.onboarding,
        page: () => const OnboardingPage(),
        middlewares: [CustomMiddleware()]),
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(name: Routes.quizFinish, page: () => QuizFinishPage()),
    GetPage(name: Routes.showQuestions, page: () => const ShowQuestionsPage()),
    GetPage(name: Routes.saveScore, page: () => const HomePage()),
  ];
}

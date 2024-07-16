import 'package:get/get_navigation/get_navigation.dart';
import 'package:mind/features/categories/presentation/pages/home_page.dart';
import 'package:mind/features/questions/presentation/pages/quiz_finish_page.dart';
import 'package:mind/features/questions/presentation/pages/show_questions_page.dart';
import 'package:mind/routing/routes.dart';
import 'package:mind/utils/middleware/custom_middleware.dart';
import '../features/user/presentation/pages/onboarding_screen.dart';

class AppRoutes {
  static final pages = [
    GetPage(
        name: Routes.onboarding,
        page: () => const CustomOnboardingPage(),
        middlewares: [CustomMiddleware()]),
    GetPage(name: Routes.home, page: () => const CustomHomePage()),
    GetPage(name: Routes.quizFinish, page: () => CustomQuizFinishPage()),
    GetPage(
        name: Routes.showQuestions,
        page: () => const CustomShowQuestionsPage()),
    GetPage(name: Routes.saveScore, page: () => const CustomHomePage()),
  ];
}

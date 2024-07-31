import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/categories/presentation/controllers/home_page_controller.dart';
import 'package:mind/features/categories/presentation/pages/home/widgets/home_page_failure.dart';
import 'package:mind/features/categories/presentation/pages/home/widgets/home_page_success.dart';
import '../../../../user/presentation/controllers/profile_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => HomeController());

    return GetBuilder<HomeController>(
      builder: (controller) {
        if (controller.categories != null) {
          // Success
          return HomePageSuccess(controller: controller);
        } else if (controller.failure != null) {
          // Failure
          return HomePageFailure(controller: controller);
        } else {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/quiz/screens/home_screen.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // Variables
  RxBool isEnabled = false.obs;
  TextEditingController usernameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  // called by the next button
  void next() {
    // test for enabled
    if (isEnabled.value) {
      // validate text
      if (!formKey.currentState!.validate()) {
        usernameController.clear();
        isEnabled.value = false;
      } else {
        // Save username to database
        // Continue to home page
        Get.offAll(() => const HomeScreen());
        // ignore: avoid_print
        print('Continue to Home Page =========> ');
      }
    }
  }

  // On text changed in username controller
  void onChanged() {
    if (usernameController.text.isNotEmpty) {
      isEnabled.value = true;
    } else {
      isEnabled.value = false;
    }
  }
}

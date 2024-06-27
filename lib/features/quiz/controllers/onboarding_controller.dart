import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mind/features/quiz/screens/home_screen.dart';
import 'package:mind/utils/constants/images.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // Variables
  RxBool isEnabled = false.obs;
  TextEditingController usernameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  // called by the next button
  void next() async {
    // test for enabled
    if (isEnabled.value) {
      // validate text
      if (!formKey.currentState!.validate()) {
        usernameController.clear();
        isEnabled.value = false;
      } else {
        // Save username to Local Storage
        final Map user = {
          'name': usernameController.text,
          'points': 0,
          'image': CImages.defaultUserImage
        };

        GetStorage('Users').write('users', [user]);

        // Continue to home page
        Get.offAll(() => const HomeScreen());
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

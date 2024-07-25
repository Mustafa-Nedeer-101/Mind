import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/categories/presentation/pages/home/home_page.dart';
import 'package:mind/core/helper_classes/get_storage_manager.dart';

class CustomOnboardingController extends GetxController {
  static CustomOnboardingController get instance => Get.find();

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
        final localStorage = GetStorageManager.instance();

        final Map<String, dynamic> user = {
          'name': usernameController.text,
          'id': '',
          'points': 2000000,
          'image': '',
          'ranking': '',
          'musicEnabled': true,
          'rankingUpdate': false,
        };

        localStorage.saveData('users', [user]);

        // Continue to home page
        Get.offAll(() => const HomePage());
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

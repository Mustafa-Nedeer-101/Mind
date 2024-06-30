import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mind/features/quiz/controllers/profile_screen_controller.dart';
import 'package:mind/utils/local_storage/storage_utility.dart';

class ChangeNameController extends GetxController {
  // variables
  final ULocalStorage storage = ULocalStorage.instance();
  final ProfileController profileController = Get.find();
  GlobalKey<FormState> changeNameKey = GlobalKey();
  TextEditingController changeNameController = TextEditingController();

  // Save User Name in Local Storage
  void saveName() async {
    // Validate
    if (!changeNameKey.currentState!.validate()) return;

    // Change Profile Controller
    await profileController.changeUserName(changeNameController.text);

    Get.back();
    return;
  }
}

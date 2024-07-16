import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/user/presentation/controllers/profile_controller.dart';

class CustomChangeNameController extends GetxController {
  // variables
  final CustomProfileController profileController = Get.find();
  GlobalKey<FormState> changeNameKey = GlobalKey();
  TextEditingController changeNameController = TextEditingController();

  // Save User Name in Local Storage
  void saveName() async {
    // Validate
    if (!changeNameKey.currentState!.validate()) return;

    // Change Profile Controller
    await profileController.changeName(name: changeNameController.text);

    Get.back();
    return;
  }
}

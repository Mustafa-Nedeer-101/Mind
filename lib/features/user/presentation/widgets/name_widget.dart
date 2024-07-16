import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/user/presentation/pages/change_name_page.dart';
import '../../../../common/widgets/profile_menu.dart';
import '../controllers/profile_controller.dart';

class CustomUserName extends StatelessWidget {
  final CustomProfileController profileController;
  const CustomUserName({super.key, required this.profileController});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ProfileMenu(
        onPressed: () {
          Get.to(() => const CustomChangeNamePage());
        },
        title: "name",
        value: profileController.user!.value.name.value,
      ),
    );
  }
}

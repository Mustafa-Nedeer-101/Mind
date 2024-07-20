import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/user/presentation/pages/change_name_page.dart';
import '../../../../core/common/widgets/profile_menu.dart';
import '../controllers/profile_controller.dart';

class UserName extends StatelessWidget {
  final ProfileController profileController;
  const UserName({super.key, required this.profileController});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomProfileMenu(
        onPressed: () {
          Get.to(() => const ChangeNamePage());
        },
        title: "name",
        value: profileController.user!.value.name.value,
      ),
    );
  }
}

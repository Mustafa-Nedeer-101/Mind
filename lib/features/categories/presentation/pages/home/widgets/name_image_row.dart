import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/common/widgets/circular_image.dart';
import '../../../../../user/presentation/controllers/profile_controller.dart';
import '../../../../../user/presentation/pages/profile_page.dart';

class NameImageSection extends StatelessWidget {
  const NameImageSection({super.key, required this.profileController});

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Name
            Obx(
              () => Text("Hi, ${profileController.user!.value.name.value}", //
                  style: Theme.of(context).textTheme.headlineLarge),
            ),

            const Text("Let's make the day productive",
                overflow: TextOverflow.ellipsis),
          ],
        ),

        // Profile Image
        GestureDetector(
          onTap: () {
            Get.to(() => const ProfilePage());
          },
          child: Obx(
            () => CustomCircularImage(
              image: profileController.user!.value.image.value,
            ),
          ),
        ),
      ],
    );
  }
}

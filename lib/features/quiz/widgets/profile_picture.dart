import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/quiz/widgets/circular_image.dart';
import 'package:mind/utils/constants/images.dart';
import 'package:mind/utils/constants/sizes.dart';

class ProfilePictureSection extends StatelessWidget {
  const ProfilePictureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          // Circular Image
          Obx(() {
            const networkImage = '';
            final image = networkImage.isNotEmpty
                ? networkImage
                : CImages.defaultUserImage;
            return true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                // ignore: dead_code
                : CustomCircularImage(
                    width: 80,
                    height: 80,
                    image: image,
                    isNetworkImage: networkImage.isNotEmpty,
                  );
          }),

          const SizedBox(
            height: CSizes.spaceBtwItems,
          ),

          // change image
          TextButton(
              onPressed: () {}, child: const Text("Change Profile Picture"))
        ],
      ),
    );
  }
}

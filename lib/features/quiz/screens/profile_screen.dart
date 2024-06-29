import 'package:flutter/material.dart';
import 'package:mind/utils/constants/colors.dart';
import 'package:mind/utils/constants/images.dart';
import 'package:mind/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: CSizes.appBarHeight, left: CSizes.md, right: CSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image Section
              const ProfileImageSection(),

              const Divider(),

              // Options Section

              Column(
                children: [
                  // Header
                  Row(children: [
                    Text(
                      'Options',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ]),

                  // Space
                  const SizedBox(
                    height: CSizes.spaceBtwInputFields,
                  ),

                  // Notifications
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text
                      const Text('Allow Notifications'),

                      // Switch
                      Switch(value: false, onChanged: (value) {}),
                    ],
                  ),

                  // Space
                  const SizedBox(
                    height: CSizes.spaceBtwInputFields,
                  ),

                  // Notifications
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text
                      const Text('Allow Notifications'),

                      // Switch
                      Switch(value: false, onChanged: (value) {}),
                    ],
                  ),

                  // Space
                  const SizedBox(
                    height: CSizes.spaceBtwInputFields,
                  ),

                  // Notifications
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text
                      const Text('Allow Notifications'),

                      // Switch
                      Switch(value: false, onChanged: (value) {}),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: const Image(
              width: 100,
              height: 100,
              image: AssetImage(CImages.defaultUserImage)),
        ),

        const SizedBox(
          height: CSizes.sm,
        ),

        // Name
        Text(
          "Mustafa",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: CColors.primary),
        )
      ],
    );
  }
}

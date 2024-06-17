import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind/features/quiz/controllers/onboarding_controller.dart';
import 'package:mind/utils/constants/colors.dart';
import 'package:mind/utils/constants/sizes.dart';
import 'package:mind/utils/validators/validators.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: CSizes.appBarHeight,
              left: CSizes.defaultSpace,
              right: CSizes.defaultSpace),
          child: Column(
            children: [
              // Logo

              // Space
              const SizedBox(
                height: 200,
              ),

              // TextField
              Row(
                children: [
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Enter your username",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
              const SizedBox(
                height: CSizes.sm,
              ),

              Form(
                  key: controller.formKey,
                  child: TextFormField(
                    validator: UValidator.validateUsername,
                    controller: controller.usernameController,
                    onChanged: (value) => controller.onChanged(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.none,
                          width: 0,
                        ),
                      ),
                    ),
                  )),

              // Space
              const SizedBox(
                height: CSizes.spaceBtwSections,
              ),

              // Next Button
              Obx(
                () => GestureDetector(
                  onTap: controller.next,
                  child: Container(
                    width: 90,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: controller.isEnabled.value
                            ? const Color(0xFFFFFFFF)
                            : CColors.darkerGrey),
                    child: const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

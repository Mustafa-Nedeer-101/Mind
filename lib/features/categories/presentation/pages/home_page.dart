import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mind/features/categories/presentation/controllers/home_page_controller.dart';
import 'package:mind/features/categories/presentation/widgets/category_card.dart';
import 'package:mind/features/categories/presentation/widgets/personal_information.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../user/presentation/controllers/profile_controller.dart';
import '../../../questions/presentation/widgets/quiz_settings_bottom_sheet.dart';

class CustomHomePage extends StatelessWidget {
  const CustomHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomProfileController());
    Get.put(CustomHomeController());

    return GetBuilder<CustomHomeController>(
      builder: (controller) {
        if (controller.categories != null) {
          return Scaffold(
              body: Padding(
            padding: EdgeInsets.only(
              top: (CSizes.lg).h,
              left: (CSizes.md).w,
              right: (CSizes.md).w,
            ),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // AppBar Space
                    const SizedBox(
                      height: (CSizes.defaultSpace),
                    ),

                    // Personal Information
                    const CustomPersonalInformation(),

                    // Space
                    SizedBox(
                      height: CSizes.spaceBtwInputFields.h,
                    ),

                    // Let's Play
                    Text(
                      "Let's play",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),

                    SizedBox(
                      height: CSizes.spaceBtwInputFields.h,
                    ),

                    // Grid
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: controller.categories!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio:
                              MediaQuery.of(context).size.width < 500 ? 0.8 : 1,
                          crossAxisCount: 2,
                          crossAxisSpacing: CSizes.md.w,
                          mainAxisSpacing: CSizes.spaceBtwSections.h),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              CustomQuizSettingsBottomSheet(
                                title: controller.categories![index].name,
                                categoryId: controller.categories![index].id,
                              ),
                              isScrollControlled: true,
                            );
                          },
                          child: CustomCategoryCard(
                            category: controller.categories![index].name,
                            numOfQ:
                                controller.categories![index].numberOfQuestions,
                            imageString: controller.categories![index].image,
                          ),
                        );
                      },
                    ),

                    SizedBox(
                      height: CSizes.md.h,
                    )
                  ]),
            ),
          ));
        } else if (controller.failure != null) {
          // Error
          return Center(
            child: Text(
              'Error: ${controller.failure!.errorMessage}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

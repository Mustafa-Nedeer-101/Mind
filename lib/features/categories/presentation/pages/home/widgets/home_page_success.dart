import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mind/features/categories/presentation/controllers/home_page_controller.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../questions/presentation/pages/quiz/widgets/quiz_settings_bottom_sheet.dart';
import 'category_card.dart';
import 'personal_information.dart';

class HomePageSuccess extends StatelessWidget {
  const HomePageSuccess({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: CSizes.defaultSpace.h,
                bottom: CSizes.sm.h,
                left: CSizes.sm.w,
                right: CSizes.sm.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                            QuizSettingsBottomSheet(
                              title: controller.categories![index].name,
                              categoryId: controller.categories![index].id,
                            ),
                            isScrollControlled: true,
                          );
                        },
                        child: CategoryCard(
                          category: controller.categories![index].name,
                          numOfQ:
                              controller.categories![index].numberOfQuestions,
                          imageString: controller.categories![index].image,
                        ),
                      );
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

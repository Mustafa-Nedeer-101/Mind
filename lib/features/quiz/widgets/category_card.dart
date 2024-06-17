import 'package:flutter/material.dart';

import 'package:mind/utils/constants/colors.dart';
import 'package:mind/utils/constants/sizes.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard(
      {super.key,
      required this.category,
      required this.numOfQ,
      required this.imageString});

  final String category, imageString;
  final int numOfQ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: CColors.darkerGrey,
              borderRadius: BorderRadius.circular(16),
            ),
          ),

          // Text
          Positioned(
            left: CSizes.md,
            bottom: CSizes.defaultSpace,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: CSizes.sm,
                ),
                Text(
                  "$numOfQ questions",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
          ),

          // Shadow
          Positioned(
            left: CSizes.md + 30,
            top: CSizes.lg + 100,
            child: Container(
              width: 90,
              height: 15,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: CColors.black.withOpacity(0.8),
                      spreadRadius: 0,
                      blurRadius: 15,
                    )
                  ],
                  shape: BoxShape.rectangle,
                  borderRadius:
                      BorderRadius.circular(10) // If you want a circular shadow
                  ),
            ),
          ),

          // Image
          Positioned(
            top: -15,
            left: CSizes.md,
            child: Image(
              image: AssetImage(imageString),
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

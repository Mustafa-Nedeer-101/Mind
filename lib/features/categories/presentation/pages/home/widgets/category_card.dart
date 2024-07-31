import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard(
      {super.key,
      required this.category,
      required this.numOfQ,
      required this.imageString});

  final String category, imageString;
  final int numOfQ;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  void initState() {
    super.initState();
    // Delay the preloading until after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preloadImage();
    });
  }

  void _preloadImage() {
    // Preload the image to reduce rasterization jank
    precacheImage(AssetImage(widget.imageString), context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CColors.darkerGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          // Category & Number of Questions
          Positioned(
            top: MediaQuery.of(context).size.width < 500 ? -25.h : -30.h,
            left: CSizes.md.h,
            bottom: CSizes.sm.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                Image(
                  image: AssetImage(widget.imageString),
                  width: 100.w, // Fixed width
                  height: 100.h, // Fixed height
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.low,
                ),

                // Space
                const Expanded(
                  flex: 3,
                  child: SizedBox(),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Name
                      Text(
                        widget.category,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),

                      // Number of Questions
                      Text(
                        "${widget.numOfQ} questions",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),

                // Space
                const Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

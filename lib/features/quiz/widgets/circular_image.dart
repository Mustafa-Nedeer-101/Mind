import 'package:flutter/material.dart';
import 'package:mind/utils/constants/colors.dart';
import 'package:mind/utils/constants/images.dart';
import 'package:mind/utils/constants/sizes.dart';

class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage(
      {super.key,
      this.fit = BoxFit.fill,
      required this.image,
      this.isNetworkImage = false,
      this.overlayColor,
      this.backgroundColor,
      this.width = 56,
      this.height = 56,
      this.padding = CSizes.sm});

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: CColors.black,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
              child: image.isEmpty // Image string is empty
                  ? Image(
                      fit: fit,
                      image: const AssetImage(CImages.defaultUserImage),
                      color: overlayColor,
                      height: height,
                      width: width,
                    )
                  : Image(
                      fit: fit,
                      image: AssetImage(image),
                      color: overlayColor,
                      height: height,
                      width: width,
                    ))),
    );
  }
}

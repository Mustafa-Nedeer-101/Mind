import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind/core/constants/images.dart';

class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
  });

  final BoxFit? fit;
  final String image;
  final Color? overlayColor;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    double dimension = width.w;

    return ClipRRect(
      borderRadius: BorderRadius.circular(dimension / 2),
      child: Container(
        width: dimension,
        height: dimension,
        color: Colors.transparent,
        child: image.isEmpty
            ? Image(
                fit: fit,
                image: const AssetImage(CImages.defaultUserImage),
                color: overlayColor,
                height: dimension,
                width: dimension,
              )
            : Image(
                fit: fit,
                image: FileImage(File(image)),
                color: overlayColor,
                height: dimension,
                width: dimension,
              ),
      ),
    );
  }
}

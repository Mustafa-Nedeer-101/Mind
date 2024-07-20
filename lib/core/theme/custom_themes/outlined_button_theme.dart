import 'package:flutter/material.dart';
import 'package:mind/core/constants/colors.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  // Light Mode
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.black,
        side: const BorderSide(color: CColors.primary),
        textStyle: const TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
  );

  // Dark Mode
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        side: const BorderSide(color: CColors.primary),
        textStyle: const TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
  );
}

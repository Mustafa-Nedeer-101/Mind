// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mind/utils/constants/colors.dart';

class TTextButtonTheme {
  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(CColors.primary),
      foregroundColor: MaterialStateProperty.all<Color>(CColors.white),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      overlayColor:
          MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.2)),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );

  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          WidgetStateProperty.all<Color>(CColors.primary.withOpacity(0.5)),
      foregroundColor:
          MaterialStateProperty.all<Color>(CColors.white.withOpacity(0.8)),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      overlayColor:
          MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.2)),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}

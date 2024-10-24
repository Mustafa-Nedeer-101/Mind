// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mind/core/constants/colors.dart';

class TCheckBoxTheme {
  TCheckBoxTheme._();

  // Customizable Light Check Box Theme
  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return CColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );

  // Customizable Dark Check Box Theme

  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return CColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}

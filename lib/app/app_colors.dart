import 'package:flutter/material.dart';

class AppColors {
  static const Color kcPrimaryColor = Color.fromRGBO(169, 63, 254, 1);
  static const Color kcPrimaryColorDark = Color(0xFF80B5A0);
  static const Color kcTextColor = Color(0xFF80B5A0);
  static const Color kcBlackColor = Color.fromARGB(255, 0, 0, 0);
  static const Color kcTextGreyColor = Color.fromRGBO(0, 0, 0, 0.4);
  static const Color kcWhiteColor = Color(0xFFFFFFFF);
  static const Color kcVeryLightGrey = Color(0xFFE3E3E3);
  static const Color kcBackgroundColor = Color.fromRGBO(245, 245, 250, 1);
  static const Color kcErrorColor = Color.fromARGB(255, 253, 0, 0);
  static const Color ontop = Color.fromARGB(30, 93, 109, 1);
  static const MaterialColor primarySwatch = MaterialColor(
    0xFFA93FFE,
    <int, Color>{
      50: kcPrimaryColor,
      100: kcPrimaryColor,
      200: kcPrimaryColor,
      300: kcPrimaryColor,
      400: kcPrimaryColor,
      500: kcPrimaryColor,
      600: kcPrimaryColor,
      700: kcPrimaryColor,
      800: kcPrimaryColor,
      900: kcPrimaryColor,
    },
  );
}

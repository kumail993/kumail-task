import 'package:eaisoft/app/app_colors.dart';
import 'package:flutter/material.dart';

TextStyle globalTextStyle(
        {required double fontSize,
        Color? color,
        double? letterSpacing,
        FontWeight? fontWeight,
        TextDecoration? decoration}) =>
    TextStyle(
      color: color ?? AppColors.kcBlackColor,
      fontSize: fontSize,
      letterSpacing: letterSpacing ?? 0.5,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontFamily: 'TT Commons',
      decoration: decoration ?? TextDecoration.none,
    );

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/src/core/app_values/app_values.dart';

part 'type.dart';
part 'shape.dart';

final ThemeData materialTheme = ThemeData(
  primaryColor: UIColors.primaryColor,
  colorScheme: const ColorScheme.light(
    primary: UIColors.primaryColor,
    secondary: UIColors.secondaryColor,
  ),
  fontFamily: UIFonts.primary,
  textTheme: TextTheme(
    headlineLarge: h1,
    headlineMedium: h2,
    headlineSmall: h3,
    bodyMedium: normalText,
    bodySmall: smallText,
    labelSmall: smallText,
    labelMedium: normalText,
    displayMedium: normalText,
    displaySmall: smallText,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: smallText,
  ),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: UIColors.secondaryColor),
);

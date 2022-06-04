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
    headline1: h1,
    headline2: h2,
    headline3: h3,
    bodyText1: normalText,
    bodyText2: smallText,
  ),
);

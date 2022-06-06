import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/src/core/app_values/app_values.dart';

AppBar commonAppbar(BuildContext context, bool isBack, {String? title}) =>
    AppBar(
      shadowColor: UIColors.secondaryColor,
      toolbarHeight: 70.h,
      centerTitle: true,
      leading: isBack
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          : const SizedBox.shrink(),
      title: title == null
          ? Image.asset(
              Assets.catProgrammer,
              height: 60.h,
              width: 60.h,
            )
          : Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
    );

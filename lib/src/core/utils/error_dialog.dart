import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/generated/l10n.dart';
import 'package:github_gap/src/core/app_values/app_values.dart';
import 'package:github_gap/src/core/theme/theme.dart';
import 'package:github_gap/src/core/utils/error_translator.dart';
import 'package:github_gap/src/core/widgets/primary_button.dart';

void showErroDialog(BuildContext context, String? key) {
  final message = getErrorMessage(context, key);

  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: borderRadiusMedium),
      child: Container(
        height: 300.h,
        width: 300.w,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: UIColors.auxiliaryColor,
          borderRadius: borderRadiusMedium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).errorTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            PrimaryButton(
              text: "Ok",
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    ),
  );
}

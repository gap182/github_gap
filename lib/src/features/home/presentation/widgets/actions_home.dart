import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/generated/l10n.dart';
import 'package:github_gap/src/core/app_values/app_values.dart';
import 'package:github_gap/src/core/dependencies/dependencies.dart';
import 'package:github_gap/src/core/widgets/custom_textfield.dart';
import 'package:github_gap/src/core/widgets/primary_button.dart';

class ActionsHome extends ConsumerWidget {
  const ActionsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        PrimaryButton(
          height: 50.h,
          text: S.of(context).tryItWithThisApp,
          showIcon: true,
          onPressed: () {
            ref.read(homeProvider.notifier).loadMainRepo();
          },
        ),
        SizedBox(height: 20.h),
        CustomTextfield(
          height: 50.h,
          hintText: S.of(context).searchAGithubUser,
          action: () {},
          showAction: true,
          iconAction: const Icon(
            Icons.search,
            color: UIColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}

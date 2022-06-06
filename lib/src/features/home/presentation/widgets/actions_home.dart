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
          height: 60.h,
          text: S.of(context).tryItWithThisApp,
          showIcon: true,
          onPressed: () {
            ref.read(homeProvider.notifier).loadThisRepoData();
          },
        ),
        SizedBox(height: 20.h),
        Consumer(
          builder: (context, ref, child) {
            final textToSearch =
                ref.watch(homeProvider.select((value) => value.textToSearch));
            return CustomTextfield(
              height: 60.h,
              hintText: S.of(context).searchAGithubUser,
              onChanged: ref.read(homeProvider.notifier).changeTextToSearch,
              action: (textToSearch != null && textToSearch.isNotEmpty)
                  ? () async {
                      await ref.read(homeProvider.notifier).loadUserData();
                    }
                  : null,
              showAction: true,
              iconAction: const Icon(
                Icons.search,
                color: UIColors.secondaryColor,
              ),
            );
          },
        ),
      ],
    );
  }
}

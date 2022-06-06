import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/src/core/app_values/app_values.dart';
import 'package:github_gap/src/core/theme/theme.dart';

class CommitCard extends StatelessWidget {
  const CommitCard({
    Key? key,
    this.sha,
    this.commiter,
    this.date,
    this.message,
  }) : super(key: key);

  final String? sha;
  final String? commiter;
  final String? date;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: UIColors.primaryColor.withOpacity(0.6),
        borderRadius: borderRadiusMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Sha: $sha", style: Theme.of(context).textTheme.bodySmall),
          Text("Commiter: $commiter",
              style: Theme.of(context).textTheme.bodySmall),
          Text("Date: $date", style: Theme.of(context).textTheme.bodySmall),
          Text("Message: $message",
              style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

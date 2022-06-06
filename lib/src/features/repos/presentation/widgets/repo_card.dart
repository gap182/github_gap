import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/src/core/app_values/app_values.dart';
import 'package:github_gap/src/core/theme/theme.dart';

class RepoCard extends StatelessWidget {
  const RepoCard({
    Key? key,
    this.name,
    this.description,
    this.createdAt,
  }) : super(key: key);

  final String? name;
  final String? description;
  final String? createdAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: UIColors.auxiliaryColor.withOpacity(0.6),
        borderRadius: borderRadiusMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Repository: $name",
              style: Theme.of(context).textTheme.bodyMedium),
          Text("Description: $description",
              style: Theme.of(context).textTheme.bodySmall),
          Text("Created At: $createdAt",
              style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

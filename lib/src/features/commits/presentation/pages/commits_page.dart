import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/src/core/app_values/app_values.dart';
import 'package:github_gap/src/core/dependencies/dependencies.dart';
import 'package:github_gap/src/core/domain/entities/repos_entity.dart';
import 'package:github_gap/src/core/theme/theme.dart';
import 'package:github_gap/src/core/utils/common_appbar.dart';
import 'package:github_gap/src/core/utils/common_extension.dart';
import 'package:github_gap/src/features/repos/presentation/widgets/repo_card.dart';

class CommitsPage extends ConsumerWidget {
  const CommitsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reposEntity =
        ref.watch(reposProvider.select((value) => value.selectedRepo));
    return Scaffold(
      appBar: commonAppbar(context, true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            RepoCard(
              name: reposEntity?.reposInfoEntity.name,
              description: reposEntity?.reposInfoEntity.description,
              createdAt: reposEntity?.reposInfoEntity.createdAt.format(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: reposEntity?.commits.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Container(
                      height: 150.h,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: UIColors.primaryColor.withOpacity(0.6),
                        borderRadius: borderRadiusMedium,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Sha: ${reposEntity?.commits[index].sha}",
                              style: Theme.of(context).textTheme.bodySmall),
                          Text(
                              "Commiter: ${reposEntity?.commits[index].commit.committer?.name}",
                              style: Theme.of(context).textTheme.bodySmall),
                          Text(
                              "Date: ${reposEntity?.commits[index].commit.committer?.date?.hourFormat()}",
                              style: Theme.of(context).textTheme.bodySmall),
                          Text(
                              "Message: ${reposEntity?.commits[index].commit.message}",
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

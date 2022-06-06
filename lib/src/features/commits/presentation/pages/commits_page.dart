import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/generated/l10n.dart';
import 'package:github_gap/src/core/app_values/app_values.dart';
import 'package:github_gap/src/core/dependencies/dependencies.dart';
import 'package:github_gap/src/core/domain/entities/repos_entity.dart';
import 'package:github_gap/src/core/theme/theme.dart';
import 'package:github_gap/src/core/utils/common_appbar.dart';
import 'package:github_gap/src/core/utils/common_extension.dart';
import 'package:github_gap/src/core/utils/error_dialog.dart';
import 'package:github_gap/src/core/widgets/custom_loading.dart';
import 'package:github_gap/src/features/commits/presentation/widgets/commit_card.dart';
import 'package:github_gap/src/features/home/presentation/state/home_state.dart';
import 'package:github_gap/src/features/repos/presentation/state/repos_state.dart';
import 'package:github_gap/src/features/repos/presentation/widgets/repo_card.dart';

class CommitsPage extends ConsumerWidget {
  const CommitsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reposEntity =
        ref.watch(reposProvider.select((value) => value.selectedRepo));

    final repoStatus =
        ref.watch(reposProvider.select((value) => value.reposStatus));

    ref.listen<ReposState>(
      reposProvider,
      (prev, curr) {
        if (curr.reposStatus == ReposStatus.error) {
          final error =
              ref.watch(reposProvider.select((value) => value.errorHandler));
          showErroDialog(context, error?.keyId);
        }
      },
    );

    return Stack(
      children: [
        Scaffold(
          appBar: commonAppbar(context, true, title: S.of(context).commits),
          floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.cloud_sync,
              color: UIColors.primaryColor,
            ),
            onPressed: () {
              ref.read(reposProvider.notifier).reloadCommits();
            },
          ),
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
                        child: CommitCard(
                          sha: reposEntity?.commits[index].sha,
                          commiter: reposEntity
                              ?.commits[index].commit.committer?.name,
                          date: reposEntity
                              ?.commits[index].commit.committer?.date
                              ?.hourFormat(),
                          message: reposEntity?.commits[index].commit.message,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        if (repoStatus == ReposStatus.loading) const CustomLoading()
      ],
    );
  }
}

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_gap/generated/l10n.dart';
import 'package:github_gap/src/core/dependencies/dependencies.dart';
import 'package:github_gap/src/core/utils/common_appbar.dart';
import 'package:github_gap/src/core/utils/common_extension.dart';
import 'package:github_gap/src/features/repos/presentation/widgets/avatar_image.dart';
import 'package:github_gap/src/features/repos/presentation/widgets/repo_card.dart';
import 'package:go_router/go_router.dart';

class ReposPage extends ConsumerWidget {
  const ReposPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repoData = ref.watch(reposProvider);
    final reposList = repoData.dataEntity?.userEntity?.repos;
    final url = repoData.dataEntity?.userEntity?.userInfoEntity.htmlUrl;

    return Scaffold(
      appBar: commonAppbar(context, true, title: S.of(context).repositories),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: GestureDetector(
                  onTap: url != null
                      ? () {
                          context.push('/home/repos/webpage', extra: url);
                        }
                      : null,
                  child: AvatarImage(
                    userInfoEntity:
                        repoData.dataEntity?.userEntity?.userInfoEntity,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: reposList?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ref
                          .read(reposProvider.notifier)
                          .changeSelectedRepo(reposList?[index]);
                      context.push('/home/commits');
                    },
                    child: RepoCard(
                      name: reposList?[index].reposInfoEntity.name,
                      description:
                          reposList?[index].reposInfoEntity.description,
                      createdAt:
                          reposList?[index].reposInfoEntity.createdAt.format(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

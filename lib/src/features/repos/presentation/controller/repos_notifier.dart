import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_gap/src/core/dependencies/dependencies.dart';
import 'package:github_gap/src/core/domain/entities/data_entity.dart';
import 'package:github_gap/src/core/domain/entities/repos_entity.dart';
import 'package:github_gap/src/core/domain/repositories/data_repository.dart';
import 'package:github_gap/src/features/repos/presentation/state/repos_state.dart';

class ReposNotifier extends StateNotifier<ReposState> {
  ReposNotifier({
    required this.ref,
    required this.repository,
  }) : super(ReposState());

  final Ref ref;
  final DataRepository repository;

  void updateData(DataEntity? dataEntity) {
    state = state.copyWith(
      dataEntity: () => dataEntity,
    );
  }

  void changeSelectedRepo(ReposEntity? reposEntity) {
    state = state.copyWith(selectedRepo: () => reposEntity);
  }

  void reloadCommits() async {
    state = state.copyWith(reposStatus: ReposStatus.loading);
    if (state.selectedRepo!.commits[0].commit.author?.name != null) {
      final response = await repository
          .getData(state.selectedRepo!.commits[0].commit.author!.name!);
      if (response.response != null && response.error == null) {
        print('REPO LENGHT');
        print(response.response?.userEntity?.repos.length);
        ref.read(reposProvider.notifier).updateData(response.response);
        state = state.copyWith(reposStatus: ReposStatus.done);
      } else {
        state = state.copyWith(
            reposStatus: ReposStatus.error, errorHandler: () => response.error);
      }
    }

    final updatedRepos = state.dataEntity?.userEntity?.repos;

    final repoToUpdate = updatedRepos?.firstWhere((element) =>
        element.reposInfoEntity.id == state.selectedRepo?.reposInfoEntity.id);

    changeSelectedRepo(repoToUpdate);

    state = state.copyWith(reposStatus: ReposStatus.initial);
  }
}

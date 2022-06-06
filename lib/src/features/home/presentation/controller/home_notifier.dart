import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_gap/src/core/dependencies/dependencies.dart';
import 'package:github_gap/src/core/domain/repositories/data_repository.dart';
import 'package:github_gap/src/features/home/presentation/state/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier({
    required this.repository,
    required this.ref,
  }) : super(HomeState());

  final DataRepository repository;
  final Ref ref;

  void loadUserData() async {
    state = state.copyWith(homeStatus: HomeStatus.loading);

    if (state.textToSearch != null) {
      final response = await repository.getData(state.textToSearch!);

      if (response.response != null && response.error == null) {
        ref.read(reposProvider.notifier).updateData(response.response);
        state = state.copyWith(homeStatus: HomeStatus.done);
      } else {
        state = state.copyWith(
            homeStatus: HomeStatus.error, errorHandler: () => response.error);
      }
    }
    state = state.copyWith(homeStatus: HomeStatus.initial);
  }

  void loadThisRepoData() async {
    state = state.copyWith(homeStatus: HomeStatus.loading);
    final response = await repository.getData("gap182");
    if (response.response != null && response.error == null) {
      ref.read(reposProvider.notifier).updateData(response.response);
      state = state.copyWith(homeStatus: HomeStatus.done);
    } else {
      state = state.copyWith(
          homeStatus: HomeStatus.error, errorHandler: () => response.error);
    }
    state = state.copyWith(homeStatus: HomeStatus.initial);
  }

  void changeTextToSearch(String value) {
    state = state.copyWith(textToSearch: () => value);
  }
}

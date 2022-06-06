import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_gap/src/core/domain/repositories/data_repository.dart';
import 'package:github_gap/src/features/home/presentation/state/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(this.repository) : super(HomeState());

  final DataRepository repository;

  void loadUserData() async {
    state = state.copyWith(homeStatus: HomeStatus.loading);

    if (state.textToSearch != null) {
      final response = await repository.getData(state.textToSearch!);
      print('RESPONSE');
      print(response.response?.userEntity?.userInfoEntity.htmlUrl);
      print(response.response?.userEntity?.userInfoEntity.login);
      print(response.error?.statusCode);
      print(response.error?.keyId);
    }

    state = state.copyWith(homeStatus: HomeStatus.done);
  }

  void loadThisRepoData() async {
    state = state.copyWith(homeStatus: HomeStatus.loading);
    final response = await repository.getData("gap182");
    state = state.copyWith(homeStatus: HomeStatus.done);
  }

  void changeTextToSearch(String value) {
    state = state.copyWith(textToSearch: () => value);
  }
}

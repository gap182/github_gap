import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_gap/src/features/home/presentation/state/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState());

  void loadMainRepo() async {
    state = state.copyWith(homeStatus: HomeStatus.loading);

    await Future.delayed(Duration(seconds: 2));

    state = state.copyWith(homeStatus: HomeStatus.done);
  }
}

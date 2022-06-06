part of 'dependencies.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final repository = ref.watch(dataRepositoryProvider);
  return HomeNotifier(repository: repository, ref: ref);
});

final reposProvider = StateNotifierProvider<ReposNotifier, ReposState>((ref) {
  final repository = ref.watch(dataRepositoryProvider);
  return ReposNotifier(repository: repository, ref: ref);
});

part of 'dependencies.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final repository = ref.watch(dataRepositoryProvider);
  return HomeNotifier(repository);
});

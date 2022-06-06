part of 'dependencies.dart';

final dataRepositoryProvider = Provider<DataRepository>((ref) {
  final service = ref.watch(dataServiceProvider);
  return DataRepositoryImpl(dataService: service);
});

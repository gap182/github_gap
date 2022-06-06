part of 'dependencies.dart';

final dataServiceProvider = Provider<DataService>((ref) {
  final dio = ref.watch(dioProvider);
  return DataService(dio: dio);
});

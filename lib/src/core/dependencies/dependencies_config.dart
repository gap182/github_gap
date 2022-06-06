part of 'dependencies.dart';

final configProvider =
    StateNotifierProvider<ConfigNotifier, ConfigState>((ref) {
  return ConfigNotifier();
});

final dioProvider = Provider<Dio>((ref) {
  final config = ref.watch(configProvider);
  const token = String.fromEnvironment('token');

  final auth =
      'Basic ${base64Encode(utf8.encode('${config.ownerName}:$token'))}';

  final options = BaseOptions(
    baseUrl: config.baseUrl,
    headers: {
      'authorization': auth,
    },
    connectTimeout: 20000,
    receiveTimeout: 20000,
  );
  return Dio(options);
});

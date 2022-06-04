import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_gap/src/config/config_state.dart';

class ConfigNotifier extends StateNotifier<ConfigState> {
  ConfigNotifier() : super(ConfigState.fromMap({}));

  void loadConfigData() async {
    final data = await rootBundle.loadString('assets/config/config.json');
    state = ConfigState.fromJson(data);
  }
}

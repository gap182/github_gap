import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_gap/src/config/config_state.dart';

class ConfigNotifier extends StateNotifier<ConfigState> {
  ConfigNotifier() : super(ConfigState.fromMap({}));

  void loadConfigData() async {
    final data = await rootBundle.loadString('assets/config/config.json');
    state = ConfigState.fromJson(data);
  }

  String getReposUrl(String username) {
    return '${state.baseUrl}$username/repos';
  }

  String getRepoInfoUrl({
    required String username,
    required String reponame,
  }) {
    return '${state.reposUrl}$username/$reponame';
  }

  String getCommitsUrl({
    required String username,
    required String reponame,
  }) {
    return '${state.reposUrl}$username/$reponame/commits';
  }

  String getCommitsUrlMain() {
    return '${state.reposUrl}${state.ownerName}/${state.repoName}/commits';
  }
}

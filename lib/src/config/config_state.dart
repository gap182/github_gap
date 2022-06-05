import 'dart:convert';

class ConfigState {
  ConfigState({
    required this.baseUrl,
    required this.reposUrl,
    required this.ownerName,
    required this.repoName,
  });

  final String baseUrl;
  final String reposUrl;
  final String ownerName;
  final String repoName;

  ConfigState copyWith({
    String? baseUrl,
    String? reposUrl,
    String? ownerName,
    String? repoName,
  }) {
    return ConfigState(
      baseUrl: baseUrl ?? this.baseUrl,
      reposUrl: reposUrl ?? this.reposUrl,
      ownerName: ownerName ?? this.ownerName,
      repoName: repoName ?? this.repoName,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'baseUrl': baseUrl});
    result.addAll({'reposUrl': reposUrl});
    result.addAll({'ownerName': ownerName});
    result.addAll({'repoName': repoName});

    return result;
  }

  factory ConfigState.fromMap(Map<String, dynamic> map) {
    return ConfigState(
      baseUrl: map['base_url'] ?? '',
      reposUrl: map['repos_url'] ?? '',
      ownerName: map['owner_name'] ?? '',
      repoName: map['repo_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigState.fromJson(String source) =>
      ConfigState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConfigState(baseUrl: $baseUrl, reposUrl: $reposUrl, ownerName: $ownerName, repoName: $repoName)';
  }
}

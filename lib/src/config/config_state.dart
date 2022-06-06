import 'dart:convert';

class ConfigState {
  ConfigState({
    required this.baseUrl,
    required this.ownerName,
    required this.repoName,
  });

  final String baseUrl;
  final String ownerName;
  final String repoName;

  ConfigState copyWith({
    String? baseUrl,
    String? ownerName,
    String? repoName,
    String? access,
  }) {
    return ConfigState(
      baseUrl: baseUrl ?? this.baseUrl,
      ownerName: ownerName ?? this.ownerName,
      repoName: repoName ?? this.repoName,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'baseUrl': baseUrl});
    result.addAll({'ownerName': ownerName});
    result.addAll({'repoName': repoName});
    return result;
  }

  factory ConfigState.fromMap(Map<String, dynamic> map) {
    return ConfigState(
      baseUrl: map['base_url'] ?? '',
      ownerName: map['owner_name'] ?? '',
      repoName: map['repo_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigState.fromJson(String source) =>
      ConfigState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConfigState(baseUrl: $baseUrl, ownerName: $ownerName, repoName: $repoName)';
  }
}

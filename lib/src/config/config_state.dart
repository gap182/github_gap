import 'dart:convert';

class ConfigState {
  ConfigState({
    required this.baseUrl,
    required this.ownerName,
    required this.repoName,
    required this.access,
  });

  final String baseUrl;
  final String access;
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
      access: access ?? this.access,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'baseUrl': baseUrl});
    result.addAll({'ownerName': ownerName});
    result.addAll({'repoName': repoName});
    result.addAll({'access': access});
    return result;
  }

  factory ConfigState.fromMap(Map<String, dynamic> map) {
    return ConfigState(
      baseUrl: map['base_url'] ?? '',
      ownerName: map['owner_name'] ?? '',
      repoName: map['repo_name'] ?? '',
      access: map['access'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigState.fromJson(String source) =>
      ConfigState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConfigState(baseUrl: $baseUrl, ownerName: $ownerName, repoName: $repoName), access: $access';
  }
}

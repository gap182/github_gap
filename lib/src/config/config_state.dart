import 'dart:convert';

class ConfigState {
  ConfigState({
    required this.baseUrl,
    required this.reposUrl,
  });

  final String baseUrl;
  final String reposUrl;

  ConfigState copyWith({
    String? baseUrl,
    String? reposUrl,
  }) {
    return ConfigState(
      baseUrl: baseUrl ?? this.baseUrl,
      reposUrl: reposUrl ?? this.reposUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'baseUrl': baseUrl});
    result.addAll({'reposUrl': reposUrl});

    return result;
  }

  factory ConfigState.fromMap(Map<String, dynamic> map) {
    return ConfigState(
      baseUrl: map['base_url'] ?? '',
      reposUrl: map['repos_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigState.fromJson(String source) =>
      ConfigState.fromMap(json.decode(source));

  @override
  String toString() => 'ConfigState(baseUrl: $baseUrl, reposUrl: $reposUrl)';
}

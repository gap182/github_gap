import 'dart:convert';

class ConfigState {
  ConfigState({
    required this.baseUrl,
  });

  final String baseUrl;

  ConfigState copyWith({
    String? baseUrl,
  }) {
    return ConfigState(
      baseUrl: baseUrl ?? this.baseUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'baseUrl': baseUrl});

    return result;
  }

  factory ConfigState.fromMap(Map<String, dynamic> map) {
    return ConfigState(
      baseUrl: map['baseUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigState.fromJson(String source) =>
      ConfigState.fromMap(json.decode(source));

  @override
  String toString() => 'ConfigState(baseUrl: $baseUrl)';

  @override
  List<Object> get props => [baseUrl];
}

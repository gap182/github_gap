class ReposEntity {
  final int id;
  final String name;
  final String fullName;
  final String htmlUrl;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime pushedAt;
  ReposEntity({
    required this.id,
    required this.name,
    required this.fullName,
    required this.htmlUrl,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
  });

  ReposEntity copyWith({
    int? id,
    String? name,
    String? fullName,
    String? htmlUrl,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? pushedAt,
  }) {
    return ReposEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      pushedAt: pushedAt ?? this.pushedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'full_name': fullName});
    result.addAll({'html_url': htmlUrl});
    result.addAll({'description': description});
    result.addAll({'created_at': createdAt.millisecondsSinceEpoch});
    result.addAll({'updated_at': updatedAt.millisecondsSinceEpoch});
    result.addAll({'pushed_at': pushedAt.millisecondsSinceEpoch});

    return result;
  }

  factory ReposEntity.fromMap(Map<String, dynamic> map) {
    return ReposEntity(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      fullName: map['full_name'] ?? '',
      htmlUrl: map['html_url'] ?? '',
      description: map['description'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
      pushedAt: DateTime.fromMillisecondsSinceEpoch(map['pushed_at']),
    );
  }

  @override
  String toString() {
    return 'ReposEntity(id: $id, name: $name, fullName: $fullName, htmlUrl: $htmlUrl, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, pushedAt: $pushedAt)';
  }
}

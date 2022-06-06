import 'package:github_gap/src/core/domain/entities/commits_entity.dart';

class ReposEntity {
  final ReposInfoEntity reposInfoEntity;
  final List<CommitsEntity> commits;
  ReposEntity({
    required this.reposInfoEntity,
    this.commits = const [],
  });

  ReposEntity copyWith({
    ReposInfoEntity? reposInfoEntity,
    List<CommitsEntity>? commits,
  }) {
    return ReposEntity(
      reposInfoEntity: reposInfoEntity ?? this.reposInfoEntity,
      commits: commits ?? this.commits,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'reposInfoEntity': reposInfoEntity.toMap()});
    result.addAll({'commits': commits.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ReposEntity.fromMap(Map<String, dynamic> map) {
    return ReposEntity(
      reposInfoEntity: ReposInfoEntity.fromMap(map['reposInfoEntity']),
      commits: List<CommitsEntity>.from(
          map['commits']?.map((x) => CommitsEntity.fromMap(x))),
    );
  }

  @override
  String toString() =>
      'ReposEntity(reposInfoEntity: $reposInfoEntity, commits: $commits)';
}

class ReposInfoEntity {
  final int id;
  final String name;
  final String fullName;
  final String htmlUrl;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime pushedAt;
  ReposInfoEntity({
    required this.id,
    required this.name,
    required this.fullName,
    required this.htmlUrl,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
  });

  ReposInfoEntity copyWith({
    int? id,
    String? name,
    String? fullName,
    String? htmlUrl,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? pushedAt,
  }) {
    return ReposInfoEntity(
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
    result.addAll({'created_at': createdAt});
    result.addAll({'updated_at': updatedAt});
    result.addAll({'pushed_at': pushedAt});

    return result;
  }

  factory ReposInfoEntity.fromMap(Map<String, dynamic> map) {
    return ReposInfoEntity(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      fullName: map['full_name'] ?? '',
      htmlUrl: map['html_url'] ?? '',
      description: map['description'] ?? '',
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      pushedAt: map['pushed_at'],
    );
  }

  @override
  String toString() {
    return 'ReposInfoEntity(id: $id, name: $name, fullName: $fullName, htmlUrl: $htmlUrl, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, pushedAt: $pushedAt)';
  }
}

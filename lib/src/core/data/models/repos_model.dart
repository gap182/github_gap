import 'dart:convert';

import 'package:github_gap/src/core/domain/entities/repos_entity.dart';

List<ReposModel> reposModelFromMap(String str) =>
    List<ReposModel>.from(json.decode(str).map((x) => ReposModel.fromMap(x)));

String reposModelToMap(List<ReposModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ReposModel {
  ReposModel({
    this.id,
    this.name,
    this.fullName,
    this.private,
    this.htmlUrl,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
  });

  final int? id;
  final String? name;
  final String? fullName;
  final bool? private;
  final String? htmlUrl;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? pushedAt;

  ReposModel copyWith({
    int? id,
    String? name,
    String? fullName,
    bool? private,
    String? htmlUrl,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? pushedAt,
  }) =>
      ReposModel(
        id: id ?? this.id,
        name: name ?? this.name,
        fullName: fullName ?? this.fullName,
        private: private ?? this.private,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        pushedAt: pushedAt ?? this.pushedAt,
      );

  ReposInfoEntity toEntity() {
    return ReposInfoEntity.fromMap(toMap());
  }

  factory ReposModel.fromMap(Map<String, dynamic> json) => ReposModel(
        id: json["id"],
        name: json["name"],
        fullName: json["full_name"],
        private: json["private"],
        htmlUrl: json["html_url"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pushedAt: json["pushed_at"] == null
            ? null
            : DateTime.parse(json["pushed_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "full_name": fullName,
        "private": private,
        "html_url": htmlUrl,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pushed_at": pushedAt,
      };
}

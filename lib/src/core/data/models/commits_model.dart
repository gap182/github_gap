import 'dart:convert';

import 'package:github_gap/src/core/domain/entities/commits_entity.dart';

List<CommitsModel> commitsModelFromMap(String str) => List<CommitsModel>.from(
    json.decode(str).map((x) => CommitsModel.fromMap(x)));

String commitsModelToMap(List<CommitsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CommitsModel {
  CommitsModel({
    this.sha,
    this.commit,
    this.htmlUrl,
  });

  final String? sha;
  final Commit? commit;
  final String? htmlUrl;

  CommitsModel copyWith({
    String? sha,
    Commit? commit,
    String? htmlUrl,
  }) =>
      CommitsModel(
        sha: sha ?? this.sha,
        commit: commit ?? this.commit,
        htmlUrl: htmlUrl ?? this.htmlUrl,
      );

  CommitsEntity toEntity() {
    return CommitsEntity.fromMap(toMap());
  }

  factory CommitsModel.fromMap(Map<String, dynamic> json) => CommitsModel(
        sha: json["sha"],
        commit: json["commit"] == null ? null : Commit.fromMap(json["commit"]),
        htmlUrl: json["html_url"],
      );

  Map<String, dynamic> toMap() => {
        "sha": sha,
        "commit": commit?.toMap(),
        "html_url": htmlUrl,
      };
}

class Commit {
  Commit({
    this.author,
    this.committer,
    this.message,
    this.commentCount,
  });

  final CommitAuthor? author;
  final CommitAuthor? committer;
  final String? message;
  final int? commentCount;

  Commit copyWith({
    CommitAuthor? author,
    CommitAuthor? committer,
    String? message,
    int? commentCount,
  }) =>
      Commit(
        author: author ?? this.author,
        committer: committer ?? this.committer,
        message: message ?? this.message,
        commentCount: commentCount ?? this.commentCount,
      );

  factory Commit.fromMap(Map<String, dynamic> json) => Commit(
        author: json["author"] == null
            ? null
            : CommitAuthor.fromMap(json["author"]),
        committer: json["committer"] == null
            ? null
            : CommitAuthor.fromMap(json["committer"]),
        message: json["message"],
        commentCount: json["comment_count"],
      );

  Map<String, dynamic> toMap() => {
        "author": author?.toMap(),
        "committer": committer?.toMap(),
        "message": message,
        "comment_count": commentCount,
      };
}

class CommitAuthor {
  CommitAuthor({
    this.name,
    this.email,
    this.date,
  });

  final String? name;
  final String? email;
  final DateTime? date;

  CommitAuthor copyWith({
    String? name,
    String? email,
    DateTime? date,
  }) =>
      CommitAuthor(
        name: name ?? this.name,
        email: email ?? this.email,
        date: date ?? this.date,
      );

  factory CommitAuthor.fromMap(Map<String, dynamic> json) => CommitAuthor(
        name: json["name"],
        email: json["email"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "date": date,
      };
}

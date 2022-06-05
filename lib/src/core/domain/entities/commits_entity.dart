class CommitsEntity {
  final String sha;
  final String htmlUrl;
  final Commit commit;
  CommitsEntity({
    required this.sha,
    required this.htmlUrl,
    required this.commit,
  });

  CommitsEntity copyWith({
    String? sha,
    String? htmlUrl,
    Commit? commit,
  }) {
    return CommitsEntity(
      sha: sha ?? this.sha,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      commit: commit ?? this.commit,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'sha': sha});
    result.addAll({'html_url': htmlUrl});
    result.addAll({'commit': commit.toMap()});

    return result;
  }

  factory CommitsEntity.fromMap(Map<String, dynamic> map) {
    return CommitsEntity(
      sha: map['sha'] ?? '',
      htmlUrl: map['html_url'] ?? '',
      commit: Commit.fromMap(map['commit']),
    );
  }

  @override
  String toString() =>
      'CommitsEntity(sha: $sha, htmlUrl: $htmlUrl, commit: $commit)';
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
        "date": date?.toIso8601String(),
      };
}

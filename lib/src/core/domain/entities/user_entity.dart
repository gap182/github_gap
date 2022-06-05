class UserEntity {
  final String login;
  final int id;
  final String avatarUrl;
  final String htmlUrl;
  final String name;
  final String email;
  final String bio;
  final String twitterUsername;
  final int publicRepos;
  UserEntity({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.name,
    required this.email,
    required this.bio,
    required this.twitterUsername,
    required this.publicRepos,
  });

  UserEntity copyWith({
    String? login,
    int? id,
    String? avatarUrl,
    String? htmlUrl,
    String? name,
    String? email,
    String? bio,
    String? twitterUsername,
    int? publicRepos,
  }) {
    return UserEntity(
      login: login ?? this.login,
      id: id ?? this.id,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      name: name ?? this.name,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      twitterUsername: twitterUsername ?? this.twitterUsername,
      publicRepos: publicRepos ?? this.publicRepos,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'login': login});
    result.addAll({'id': id});
    result.addAll({'avatar_url': avatarUrl});
    result.addAll({'html_url': htmlUrl});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'bio': bio});
    result.addAll({'twitter_username': twitterUsername});
    result.addAll({'public_repos': publicRepos});

    return result;
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      login: map['login'] ?? '',
      id: map['id']?.toInt() ?? 0,
      avatarUrl: map['avatar_url'] ?? '',
      htmlUrl: map['html_url'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      bio: map['bio'] ?? '',
      twitterUsername: map['twitter_username'] ?? '',
      publicRepos: map['public_repos']?.toInt() ?? 0,
    );
  }
}

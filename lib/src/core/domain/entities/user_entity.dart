import 'package:github_gap/src/core/domain/entities/repos_entity.dart';

class UserEntity {
  final UserInfoEntity userInfoEntity;
  final List<ReposEntity> repos;
  UserEntity({
    required this.userInfoEntity,
    this.repos = const [],
  });

  UserEntity copyWith({
    UserInfoEntity? userInfoEntity,
    List<ReposEntity>? repos,
  }) {
    return UserEntity(
      userInfoEntity: userInfoEntity ?? this.userInfoEntity,
      repos: repos ?? this.repos,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userInfoEntity': userInfoEntity.toMap()});
    result.addAll({'repos': repos.map((x) => x.toMap()).toList()});

    return result;
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      userInfoEntity: UserInfoEntity.fromMap(map['userInfoEntity']),
      repos: List<ReposEntity>.from(
          map['repos']?.map((x) => ReposEntity.fromMap(x))),
    );
  }

  @override
  String toString() =>
      'UserEntity(userInfoEntity: $userInfoEntity, repos: $repos)';
}

class UserInfoEntity {
  final String login;
  final int id;
  final String avatarUrl;
  final String htmlUrl;
  final String name;
  final String email;
  final String bio;
  final String twitterUsername;
  final int publicRepos;
  UserInfoEntity({
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

  UserInfoEntity copyWith({
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
    return UserInfoEntity(
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

  factory UserInfoEntity.fromMap(Map<String, dynamic> map) {
    return UserInfoEntity(
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

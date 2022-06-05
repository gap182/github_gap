import 'dart:convert';

import 'package:github_gap/src/core/domain/entities/user_entity.dart';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  UserModel({
    this.login,
    this.id,
    this.avatarUrl,
    this.htmlUrl,
    this.siteAdmin,
    this.name,
    this.email,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
  });

  final String? login;
  final int? id;
  final String? avatarUrl;
  final String? htmlUrl;
  final bool? siteAdmin;
  final String? name;
  final String? email;
  final String? bio;
  final String? twitterUsername;
  final int? publicRepos;

  UserModel copyWith({
    String? login,
    int? id,
    String? avatarUrl,
    String? htmlUrl,
    bool? siteAdmin,
    String? name,
    String? email,
    String? bio,
    String? twitterUsername,
    int? publicRepos,
  }) =>
      UserModel(
        login: login ?? this.login,
        id: id ?? this.id,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        siteAdmin: siteAdmin ?? this.siteAdmin,
        name: name ?? this.name,
        email: email ?? this.email,
        bio: bio ?? this.bio,
        twitterUsername: twitterUsername ?? this.twitterUsername,
        publicRepos: publicRepos ?? this.publicRepos,
      );

  UserEntity toEntity() {
    return UserEntity.fromMap(toMap());
  }

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        login: json["login"],
        id: json["id"],
        avatarUrl: json["avatar_url"],
        htmlUrl: json["html_url"],
        siteAdmin: json["site_admin"],
        name: json["name"],
        email: json["email"],
        bio: json["bio"],
        twitterUsername: json["twitter_username"],
        publicRepos: json["public_repos"],
      );

  Map<String, dynamic> toMap() => {
        "login": login,
        "id": id,
        "avatar_url": avatarUrl,
        "html_url": htmlUrl,
        "site_admin": siteAdmin,
        "name": name,
        "email": email,
        "bio": bio,
        "twitter_username": twitterUsername,
        "public_repos": publicRepos,
      };
}

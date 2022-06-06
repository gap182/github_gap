import 'package:github_gap/src/core/domain/entities/user_entity.dart';

class DataEntity {
  final UserEntity? userEntity;
  DataEntity({
    this.userEntity,
  });

  DataEntity copyWith({
    UserEntity? Function()? userEntity,
  }) {
    return DataEntity(
      userEntity: userEntity != null ? userEntity() : this.userEntity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (userEntity != null) {
      result.addAll({'userEntity': userEntity!.toMap()});
    }

    return result;
  }

  factory DataEntity.fromMap(Map<String, dynamic> map) {
    return DataEntity(
      userEntity: map['userEntity'] != null
          ? UserEntity.fromMap(map['userEntity'])
          : null,
    );
  }

  @override
  String toString() => 'DataEntity(userEntity: $userEntity)';
}

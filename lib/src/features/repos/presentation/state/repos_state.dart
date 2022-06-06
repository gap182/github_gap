import 'package:github_gap/src/core/domain/entities/data_entity.dart';

class ReposState {
  ReposState({
    this.dataEntity,
  });
  final DataEntity? dataEntity;

  ReposState copyWith({
    DataEntity? Function()? dataEntity,
  }) {
    return ReposState(
      dataEntity: dataEntity != null ? dataEntity() : this.dataEntity,
    );
  }

  @override
  String toString() => 'ReposState(dataEntity: $dataEntity)';
}

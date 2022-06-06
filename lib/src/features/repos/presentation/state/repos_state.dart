import 'package:github_gap/src/core/domain/entities/data_entity.dart';
import 'package:github_gap/src/core/domain/entities/repos_entity.dart';

class ReposState {
  ReposState({
    this.dataEntity,
    this.selectedRepo,
  });
  final DataEntity? dataEntity;
  final ReposEntity? selectedRepo;

  ReposState copyWith({
    DataEntity? Function()? dataEntity,
    ReposEntity? Function()? selectedRepo,
  }) {
    return ReposState(
      dataEntity: dataEntity != null ? dataEntity() : this.dataEntity,
      selectedRepo: selectedRepo != null ? selectedRepo() : this.selectedRepo,
    );
  }

  @override
  String toString() =>
      'ReposState(dataEntity: $dataEntity, selectedRepo: $selectedRepo)';
}

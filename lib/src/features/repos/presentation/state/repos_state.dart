import 'package:github_gap/src/core/domain/entities/data_entity.dart';
import 'package:github_gap/src/core/domain/entities/repos_entity.dart';
import 'package:github_gap/src/core/utils/error_handler.dart';

enum ReposStatus { initial, loading, done, error }

class ReposState {
  ReposState({
    this.dataEntity,
    this.selectedRepo,
    this.errorHandler,
    this.reposStatus = ReposStatus.initial,
  });
  final DataEntity? dataEntity;
  final ReposEntity? selectedRepo;
  final ReposStatus reposStatus;
  final ErrorHandler? errorHandler;

  ReposState copyWith({
    DataEntity? Function()? dataEntity,
    ReposEntity? Function()? selectedRepo,
    ReposStatus? reposStatus,
    ErrorHandler? Function()? errorHandler,
  }) {
    return ReposState(
      dataEntity: dataEntity != null ? dataEntity() : this.dataEntity,
      selectedRepo: selectedRepo != null ? selectedRepo() : this.selectedRepo,
      reposStatus: reposStatus ?? this.reposStatus,
      errorHandler: errorHandler != null ? errorHandler() : this.errorHandler,
    );
  }

  @override
  String toString() =>
      'ReposState(dataEntity: $dataEntity, selectedRepo: $selectedRepo, reposStatus: $reposStatus)';
}

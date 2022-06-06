import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_gap/src/core/domain/entities/data_entity.dart';
import 'package:github_gap/src/features/repos/presentation/state/repos_state.dart';

class ReposNotifier extends StateNotifier<ReposState> {
  ReposNotifier() : super(ReposState());

  void updateData(DataEntity? dataEntity) {
    state = state.copyWith(
      dataEntity: () => dataEntity,
    );
  }
}

import 'package:github_gap/src/core/data/services/data_service.dart';
import 'package:github_gap/src/core/domain/entities/commits_entity.dart';
import 'package:github_gap/src/core/domain/entities/data_entity.dart';
import 'package:github_gap/src/core/domain/entities/repos_entity.dart';
import 'package:github_gap/src/core/domain/entities/user_entity.dart';
import 'package:github_gap/src/core/domain/repositories/data_repository.dart';
import 'package:github_gap/src/core/utils/error_handler.dart';
import 'package:github_gap/src/core/utils/response_model.dart';

class DataRepositoryImpl implements DataRepository {
  DataRepositoryImpl({
    required this.dataService,
  });
  final DataService dataService;

  @override
  Future<ResponseModel<DataEntity, ErrorHandler>> getData(
      String userName) async {
    final response = await dataService.getData(userName);
    return response;
  }
}

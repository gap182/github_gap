import 'package:github_gap/src/core/domain/entities/data_entity.dart';
import 'package:github_gap/src/core/utils/error_handler.dart';
import 'package:github_gap/src/core/utils/response_model.dart';

abstract class DataRepository {
  Future<ResponseModel<DataEntity, ErrorHandler>> getData(String userName);
}

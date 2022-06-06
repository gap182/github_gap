import 'package:dio/dio.dart';
import 'package:github_gap/src/core/data/models/commits_model.dart';
import 'package:github_gap/src/core/data/models/repos_model.dart';
import 'package:github_gap/src/core/data/models/user_model.dart';
import 'package:github_gap/src/core/domain/entities/data_entity.dart';
import 'package:github_gap/src/core/domain/entities/repos_entity.dart';
import 'package:github_gap/src/core/domain/entities/user_entity.dart';
import 'package:github_gap/src/core/utils/error_handler.dart';
import 'package:github_gap/src/core/utils/response_model.dart';

class DataService {
  DataService({
    required this.dio,
  });
  final Dio dio;

  Future<UserModel> getUserInfo(String userName) async {
    final response = await dio.get('users/$userName');
    final model = UserModel.fromMap(response.data);
    return model;
  }

  Future<List<ReposModel>> getRepos(String userName) async {
    final repoList = <ReposModel>[];
    final response = await dio.get('users/$userName/repos');
    print("LENGHT REPOS IN SERVICE");
    print(response.data);
    for (var element in response.data) {
      repoList.add(ReposModel.fromMap(element));
    }
    return repoList;
  }

  Future<List<CommitsModel>> getCommits(
      String userName, String repoName) async {
    final commitsList = <CommitsModel>[];
    final response = await dio.get('repos/$userName/$repoName/commits');

    for (var element in response.data) {
      commitsList.add(CommitsModel.fromMap(element));
    }
    return commitsList;
  }

  Future<ResponseModel<DataEntity, ErrorHandler>> getData(
      String userName) async {
    try {
      //User data
      final userResponse = await getUserInfo(userName);

      //Repos data
      final reposResponse = await getRepos(userName);
      print('😃');
      print(reposResponse.length);

      // //Commits data
      final reposEntityList = <ReposEntity>[];
      for (var element in reposResponse) {
        if (element.name != null) {
          final commitsResponse = await getCommits(userName, element.name!);
          final commitsList = List.generate(
            commitsResponse.length,
            (index) => commitsResponse[index].toEntity(),
          );

          final repoEntity = ReposEntity(
            reposInfoEntity: element.toEntity(),
            commits: commitsList,
          );
          reposEntityList.add(repoEntity);
        }
      }

      //Join data
      UserEntity userEntity = UserEntity(
          userInfoEntity: userResponse.toEntity(), repos: reposEntityList);

      return ResponseModel(
          response: DataEntity(userEntity: userEntity), error: null);
    } on DioError catch (e) {
      print('DIO ERROR');
      print(e);
      print(e.response);
      print(e.response?.statusCode);

      if (e.message.contains('SocketException')) {
        return ResponseModel(
          response: null,
          error: ErrorHandler(statusCode: -1, keyId: 'no_internet'),
        );
      } else if (e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectTimeout) {
        return ResponseModel(
          response: null,
          error: ErrorHandler(statusCode: -1, keyId: 'no_internet'),
        );
      } else {
        if (e.response?.statusCode == 404) {
          return ResponseModel(
            response: null,
            error: ErrorHandler(
                statusCode: e.response?.statusCode ?? -1,
                keyId: 'user_not_found'),
          );
        } else if (e.response?.statusCode == 403) {
          return ResponseModel(
            response: null,
            error: ErrorHandler(
                statusCode: e.response?.statusCode ?? -1,
                keyId: 'limit_reached'),
          );
        }
        return ResponseModel(
          response: null,
          error: ErrorHandler(
              statusCode: e.response?.statusCode ?? -1, keyId: 'server_error'),
        );
      }
    } catch (e) {
      print("OTHER ERROR");
      print(e);
      return ResponseModel(
        response: null,
        error: ErrorHandler(statusCode: -2, keyId: 'internal_error'),
      );
    }
  }
}

import 'package:dio/dio.dart';
import 'package:skyislimit/app/repositories/models/repo_model.dart';
import 'package:skyislimit/app/utilities/strings.dart';
import 'package:skyislimit/remote/api_result.dart';
import 'package:skyislimit/remote/dio_exceptions.dart';
import 'package:skyislimit/remote/dio_services.dart';
import 'package:skyislimit/remote/network_enums.dart';

class SearchResultRepo {
  static final SearchResultRepo _instance = SearchResultRepo._internal();
  factory SearchResultRepo() => _instance;
  SearchResultRepo._internal();
  Future<Result> fetchTheRepoList({required String userName}) async {
    try {
      final Response response = await DioService.makeRESTrequest(
        baseOptions: BaseOptions(headers: UrlStrings.gitHubTokenHeader),
        urlPath: UrlStrings.getRepo(userName: userName),
        method: RequestMethod.getRequest,
      );
      try {
        final List<dynamic> jsonList = response.data;
        List<RepoModel> repoList =
            jsonList.map((e) => RepoModel.fromJson(json: e)).toList();
        return Result<List<RepoModel>>.success(successResponse: repoList);
      } catch (e) {
        throw ResponseParsingException();
      }
    } on DioException catch (e) {
      return Result<Failure>.failure(
          failure: CustomDioExceptions.fromDioError(
              dioError: e,
              messageType: ErrorMessageType.messageFromResponseBody,
              messagePath: "message"));
    } on ResponseParsingException catch (e) {
      return Result<Failure>.failure(
          failure: Failure(
              errorType: DioExceptionType.unknown,
              statusMessage: e.toString()));
    } catch (e) {
      return Result<Failure>.failure(
          failure: Failure(
              errorType: DioExceptionType.unknown,
              statusMessage: "oops..Something went wrong"));
    }
  }
}

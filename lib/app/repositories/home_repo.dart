import 'package:dio/dio.dart';
import 'package:skyislimit/app/repositories/models/github_user.dart';
import 'package:skyislimit/app/utilities/strings.dart';
import 'package:skyislimit/remote/api_result.dart';
import 'package:skyislimit/remote/dio_exceptions.dart';
import 'package:skyislimit/remote/dio_services.dart';
import 'package:skyislimit/remote/network_enums.dart';

class HomeRepo {
  static final HomeRepo _instance = HomeRepo._internal();
  factory HomeRepo() => _instance;
  HomeRepo._internal();
  Future<Result> fireTheSearch({required String searchQuery}) async {
    try {
      final Response response = await DioService.makeRESTrequest(
        baseOptions: BaseOptions(headers: UrlStrings.gitHubTokenHeader),
        urlPath: searchQuery,
        method: RequestMethod.getRequest,
      );
      try {
        return Result<GitHubUser>.success(
            successResponse: GitHubUser.fromJson(json: response.data));
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

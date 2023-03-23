import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/src/dto/token_response.dart';
import 'package:starter/src/presentation/auth/token_controller.dart';
import 'package:starter/src/shared/exception/network_exception.dart';

import 'package:starter/src/shared/helper/log.dart';

class DioInterceptors extends Interceptor {
  final Dio dio;
  final Ref ref;

  DioInterceptors(this.ref, this.dio);
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = ref.read(tokenController);

    if (token != null) {
      options.headers["Authorization"] = "Bearer ${token.token}";
    }
    handler.next(options);
  }

  Future<Response<dynamic>> retry(
      RequestOptions requestOptions, Dio dio) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    try {
      logIt(err);
      logIt(err.requestOptions.data);
      logIt(err.response);
      logIt(err.response?.data);
      switch (err.type) {
        case DioErrorType.connectionTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.badCertificate:
        case DioErrorType.connectionError:
          handler.reject(cloneError(err, BadNetworkException()));
          return;

        case DioErrorType.cancel:
        case DioErrorType.unknown:
          handler.reject(cloneError(err, UnKnownNetworkException()));
          return;

        case DioErrorType.badResponse:
          if (err.response!.statusCode == 401) {
            var isRefreshTokenEndPoint =
                !err.requestOptions.path.endsWith("refreshToken");
            //or use this: err.requestOptions.extra["refreshToken"] == true;

            if (err.response?.data["error"] == "TokenExpired" &&
                isRefreshTokenEndPoint) {
              logIt("TokenExpired");
              // call refreshToken like below
              await ref.read(tokenController.notifier).refreshToken();
              final res = await retry(err.requestOptions, dio);
              handler.resolve(res);
              return;
            } else {
              logIt("UnAuth");
              // recover from this maybe by logOut annd let user loging again
              ref.read(tokenController.notifier).logOut();
              handler.reject(cloneError(err, UnAuthorizeException()));
              return;
            }
          }
          // any other case to handle here
          handler.reject(cloneError(err, KnownDioException(err.response!)));
          return;
      }
    } catch (e, s) {
      logIt(e);
      logIt(s);
      handler.next(err);
    }
  }

  DioError cloneError(DioError dioError, Object error) => DioError(
      requestOptions: dioError.requestOptions,
      type: dioError.type,
      response: dioError.response,
      error: error);
}

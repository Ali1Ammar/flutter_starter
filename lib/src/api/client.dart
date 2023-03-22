import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/src/api/auth.dart';
import 'package:starter/src/api/user.dart';
import 'package:starter/src/config/constant.dart';

import '../shared/helper/log.dart';

final dioClient = Provider((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
  ));
  // config dio here
  dio.interceptors.add(RetryInterceptor(
    dio: dio,
    logPrint: logIt,
  ));

  return dio;
});

final apiClient = Provider((ref) => ApiClient(ref.read(dioClient)));

class ApiClient {
  late final UserClient user;
  late final AuthClient auth;
  ApiClient(Dio dio) {
    user = UserClient(dio);
    auth = AuthClient(dio);
  }
}

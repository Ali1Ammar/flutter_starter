import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/src/data/api/auth.dart';
import 'package:starter/src/data/api/dio_interceptor.dart';
import 'package:starter/src/data/api/user.dart';
import 'package:starter/src/config/constant.dart';

final dioClient = Provider((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: ConstValue.baseUrl,
  ));
  dio.interceptors.add(DioInterceptors(ref, dio));
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

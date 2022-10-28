import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:khana/src/api/auth.dart';
import 'package:khana/src/api/user.dart';
import 'package:khana/src/config/async_config.dart';
import 'package:khana/src/config/constant.dart';

import '../shared/helper/log.dart';

final dioClient = Provider((ref) {
  final asyncConfig = ref.read(asyncConfigProvider);
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
  ));
  // config dio here
  dio.interceptors.add(RetryInterceptor(
    dio: dio,
    logPrint: logIt,
  ));
  final cacheStore = HiveCacheStore(asyncConfig.tmpDir.path);
  final cacheOptions = CacheOptions(
    store: cacheStore,
  );
  dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

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

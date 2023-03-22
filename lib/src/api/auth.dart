import 'package:starter/src/dto/login_response.dart';
import 'package:dio/dio.dart';

class AuthClient {
  final Dio dio;

  AuthClient(this.dio);
  Future<LoginResponse> login(
      {required String phone, required String password}) async {
    final res = await dio
        .post<Map>("/login", data: {"phone": phone, "password": password});

    return LoginResponse.fromJson(res.data!.cast());
  }
}

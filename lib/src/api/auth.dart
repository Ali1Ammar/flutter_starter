import 'package:starter/src/dto/token_response.dart';
import 'package:dio/dio.dart';

class AuthClient {
  final Dio dio;

  AuthClient(this.dio);
  Future<TokenDto> login(
      {required String phone, required String password}) async {
    final res = await dio
        .post<Map>("/login", data: {"phone": phone, "password": password});

    return TokenDto.fromJson(res.data!.cast());
  }

  Future<TokenDto> refreshToken(String refreshToken) async {
    final res = await dio.post<Map>("/refreshToken", data: {
      "refreshToken": refreshToken,
    });

    return TokenDto.fromJson(res.data!.cast());
  }
}

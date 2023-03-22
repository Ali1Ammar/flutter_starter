import 'package:freezed_annotation/freezed_annotation.dart';
part "login_response.g.dart";

@JsonSerializable()
class LoginResponse {
  final String token;
  final String refreshToken;
  LoginResponse(this.token, this.refreshToken);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

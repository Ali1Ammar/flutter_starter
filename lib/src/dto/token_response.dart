import 'package:freezed_annotation/freezed_annotation.dart';

part "token_response.g.dart";

@JsonSerializable()
class TokenDto {
  final String token;
  final String refreshToken;
  TokenDto(this.token, this.refreshToken);

  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);
}

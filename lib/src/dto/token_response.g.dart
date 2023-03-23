// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenDto _$TokenDtoFromJson(Map<String, dynamic> json) => TokenDto(
      json['token'] as String,
      json['refreshToken'] as String,
    );

Map<String, dynamic> _$TokenDtoToJson(TokenDto instance) => <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };

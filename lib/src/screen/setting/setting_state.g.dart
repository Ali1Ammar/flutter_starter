// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingState _$$_SettingStateFromJson(Map<String, dynamic> json) =>
    _$_SettingState(
      themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']),
      lang: json['lang'] as String,
    );

Map<String, dynamic> _$$_SettingStateToJson(_$_SettingState instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'lang': instance.lang,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

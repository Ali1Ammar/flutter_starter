import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "setting_state.freezed.dart";
part "setting_state.g.dart";

@freezed
class SettingState with _$SettingState {
  const factory SettingState(
      {required ThemeMode themeMode, required String lang}) = _SettingState;

  factory SettingState.fromJson(Map<String, dynamic> json) =>
      _$SettingStateFromJson(json);
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/src/main/async_init.dart';
import 'package:starter/src/presentation/setting/setting_state.dart';
import 'package:starter/src/service/storage_service.dart';

final settingControllerProvider =
    StateNotifierProvider<SettingController, SettingState>((ref) {
  return SettingController(ref.read(asyncInitProvider).storage);
});

class SettingController extends StateNotifier<SettingState>
    with StorageNotifierMixin<SettingState> {
  @override
  final BaseStorage storage;
  SettingController(this.storage)
      : super(const SettingState(lang: "en", themeMode: ThemeMode.system));
  void toggleMode(bool isDark) {
    if (isDark) {
      state = state.copyWith(themeMode: ThemeMode.dark);
    } else {
      state = state.copyWith(themeMode: ThemeMode.light);
    }
  }

  void setLang(String lang) {
    state = state.copyWith(lang: lang);
  }

  @override
  String get key => "setting_config";

  @override
  setStateTo(SettingState? val) {}

  @override
  SettingState fromJson(v) {
    return SettingState.fromJson(v);
  }

  @override
  toJson(SettingState v) {
    return v.toJson();
  }
}

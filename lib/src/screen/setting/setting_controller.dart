import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hydrated_notifier/hydrated_notifier.dart';
import 'package:khana/src/screen/setting/setting_state.dart';

final settingControllerProvider =
    StateNotifierProvider<SettingController, SettingState>(
        (ref) => SettingController());

class SettingController extends HydratedStateNotifier<SettingState> {
  SettingController()
      : super(const SettingState(lang: "en", themeMode: ThemeMode.system));

  @override
  SettingState? fromJson(Map<String, dynamic> json) =>
      SettingState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(SettingState state) => state.toJson();
}

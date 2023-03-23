import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/src/presentation/setting/setting_controller.dart';

extension Translation on BuildContext {
  AppLocalizations get translator => AppLocalizations.of(this)!;
  List<Locale> get supportedLang => AppLocalizations.supportedLocales;
}

// https://codewithandrea.com/articles/app-localizations-outside-widgets-riverpod/
final translatorProvider = Provider<AppLocalizations>((ref) {
  final local =
      Locale(ref.read(settingControllerProvider).lang); ////ui.window.locale
  return lookupAppLocalizations(local);
});

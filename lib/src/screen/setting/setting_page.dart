import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:khana/src/screen/setting/setting_controller.dart';
import 'package:khana/src/shared/extention/extention.dart';

class SettingPage extends ConsumerWidget {
  final String justSomeParam;
  const SettingPage(this.justSomeParam, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingControllerProvider);
    final settingController = ref.read(settingControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translator.appTitle),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(Theme.of(context).brightness.name),
              Switch(
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: (val) {
                    settingController.toggleMode(val);
                  }),
            ],
          ),
          PopupMenuButton<Locale>(
            onSelected: (value) {
              settingController.setLang(value.languageCode);
            },
            itemBuilder: ((context) {
              return context.supportedLang
                  .map<PopupMenuItem<Locale>>((e) => PopupMenuItem<Locale>(
                        value: e,
                        child: Text(e.languageCode),
                      ))
                  .toList();
            }),
            child: Text(Localizations.localeOf(context).languageCode),
          ),
        ],
      ),
    );
  }
}

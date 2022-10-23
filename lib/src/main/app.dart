import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:khana/src/main/route.dart';
import 'package:khana/src/main/theme.dart';
import 'package:khana/src/screen/setting/setting_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(builder: (context, ref, child) {
        final appRouter = ref.watch(appRouterProvider);
        final setting = ref.watch(settingControllerProvider);

        return MaterialApp.router(
          restorationScopeId: 'app',
          //route
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          //theme
          theme: Themeing.lightTheme,
          themeMode: setting.themeMode,
          darkTheme: Themeing.darkTheme,
          //localizations
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('ar', ''),
          ],
          locale: Locale(setting.lang),
        );
      }),
    );
  }
}

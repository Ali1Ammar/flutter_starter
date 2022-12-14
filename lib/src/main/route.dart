import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:khana/src/screen/detials/detials_page.dart';
import 'package:khana/src/screen/home/home_page.dart';
import 'package:khana/src/screen/setting/setting_page.dart';

part 'route.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/", page: HomePage, initial: true),
    AutoRoute(path: "/setting", page: SettingPage),
    AutoRoute(path: "/detials/:id", page: DetialsPage),
  ],
)
class AppRouter extends _$AppRouter {}

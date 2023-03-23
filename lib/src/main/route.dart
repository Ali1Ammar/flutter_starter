import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/src/presentation/detials/detials_page.dart';
import 'package:starter/src/presentation/home/home_page.dart';
import 'package:starter/src/presentation/setting/setting_page.dart';

part 'route.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: "/",
      page: HomeRoute.page,
    ),
    AutoRoute(path: "/setting", page: SettingRoute.page),
    AutoRoute(path: "/detials/:id", page: DetialsRoute.page),
  ];
}

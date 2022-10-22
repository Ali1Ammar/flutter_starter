import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:khana/src/screen/home/home_page.dart';

part 'route.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@MaterialAutoRouter(
  replaceInRouteName: 'Page',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
  ],
)
class AppRouter extends _$AppRouter {}

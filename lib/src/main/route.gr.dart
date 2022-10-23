// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'route.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    SettingRoute.name: (routeData) {
      final args = routeData.argsAs<SettingRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SettingPage(
          args.justSomeParam,
          key: args.key,
        ),
      );
    },
    DetialsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetialsRouteArgs>(
          orElse: () => DetialsRouteArgs(id: pathParams.getInt('id')));
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DetialsPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        RouteConfig(
          SettingRoute.name,
          path: '/setting',
        ),
        RouteConfig(
          DetialsRoute.name,
          path: '/detials/:id',
        ),
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [SettingPage]
class SettingRoute extends PageRouteInfo<SettingRouteArgs> {
  SettingRoute({
    required String justSomeParam,
    Key? key,
  }) : super(
          SettingRoute.name,
          path: '/setting',
          args: SettingRouteArgs(
            justSomeParam: justSomeParam,
            key: key,
          ),
        );

  static const String name = 'SettingRoute';
}

class SettingRouteArgs {
  const SettingRouteArgs({
    required this.justSomeParam,
    this.key,
  });

  final String justSomeParam;

  final Key? key;

  @override
  String toString() {
    return 'SettingRouteArgs{justSomeParam: $justSomeParam, key: $key}';
  }
}

/// generated route for
/// [DetialsPage]
class DetialsRoute extends PageRouteInfo<DetialsRouteArgs> {
  DetialsRoute({
    Key? key,
    required int id,
  }) : super(
          DetialsRoute.name,
          path: '/detials/:id',
          args: DetialsRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'DetialsRoute';
}

class DetialsRouteArgs {
  const DetialsRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'DetialsRouteArgs{key: $key, id: $id}';
  }
}

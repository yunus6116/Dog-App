// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:dog_app/view/main_page/home_page/home_page.dart' as _i1;
import 'package:dog_app/view/main_page/main_page.dart' as _i2;
import 'package:dog_app/view/main_page/settings_page/settings_page.dart' as _i3;
import 'package:dog_app/view/splash_page/splash_page.dart' as _i4;
import 'package:flutter/material.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>(
          orElse: () => const SettingsRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.SettingsPage(
          key: args.key,
          version: args.version,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SettingsPage]
class SettingsRoute extends _i5.PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    _i6.Key? key,
    String? version,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(
            key: key,
            version: version,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i5.PageInfo<SettingsRouteArgs> page =
      _i5.PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({
    this.key,
    this.version,
  });

  final _i6.Key? key;

  final String? version;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key, version: $version}';
  }
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.WelcomeScreen]
class WelcomeRoute extends _i5.PageRouteInfo<void> {
  const WelcomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

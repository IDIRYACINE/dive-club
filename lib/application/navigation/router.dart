import 'dart:io';
import 'package:dive_club/application/features/login/feature.dart';
import 'package:dive_club/application/features/splash/feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

abstract class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case Routes.loginRoute:
        return getPageRoute(
          settings: settings,
          view: const LoginPage(),
        );
      
      default:
        return getPageRoute(
          settings: settings,
          view: const SplashView(),
        );
    }
  }

  static PageRoute<dynamic> getPageRoute({
    required RouteSettings settings,
    required Widget view,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(settings: settings, builder: (_) => view)
        : MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}

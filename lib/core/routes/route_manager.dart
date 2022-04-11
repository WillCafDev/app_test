import 'package:cawaf_services_api/cawaf_services_api.dart';
import 'package:flutter/material.dart';
import '../../pages/login/view.dart';
import '../../pages/splash/view.dart';
import '../../pages/synchronized/view/synchronized_page.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class RouteManager {
  static const String initial = AppRoutes.splash;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Object? args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute<dynamic>(builder: (_) => SplashPage());
      case AppRoutes.login:
        return MaterialPageRoute<dynamic>(builder: (_) => LoginPage());
      case AppRoutes.synchronized:
        return MaterialPageRoute<dynamic>(builder: (_) => SynchronizedPage());

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static Route<dynamic> unknownRoute(RouteSettings settings) =>
      MaterialPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
}

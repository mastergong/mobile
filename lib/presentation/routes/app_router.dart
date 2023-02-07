// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

// Routing
import './routes.dart';

@immutable
class AppRouter {
  const AppRouter._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
      builder: Routes.getRoute(settings.name),
      settings: RouteSettings(
        name: Routes.routeExists(settings.name)
            ? settings.name
            : Routes.fallbackRoute,
        arguments: settings.arguments,
      ),
    );
  }

  static Future<dynamic> pushNamed(String routeName, {dynamic args}) {
    return Future.delayed(Duration.zero, () {
      navigatorKey.currentState!.pushNamed(
        routeName,
        arguments: args,
      );
    });
  }

  static Future<dynamic> push(Widget page) {
    return Future.delayed(Duration.zero, () {
      navigatorKey.currentState!.push(
        MaterialPageRoute(builder: (_) => page),
      );
    });
  }

  static Future<void> pop([dynamic result]) async {
    navigatorKey.currentState!.pop(result);
  }

  static Future<dynamic> popAndPushNamed(String routeName, {dynamic args}) {
    return Future.delayed(Duration.zero, () {
      navigatorKey.currentState!.popAndPushNamed(
        routeName,
        arguments: args,
      );
    });
  }

  static void popUntil(String routeName) {
    navigatorKey.currentState!.popUntil(
      ModalRoute.withName(routeName),
    );
  }

  static void popUntilRoot() {
    navigatorKey.currentState!.popUntil(
      ModalRoute.withName(Routes.initialRoute),
    );
  }

  static Future<dynamic> popUntiltoPushRoot() {
    navigatorKey.currentState!.popUntil(
      ModalRoute.withName(Routes.initialRoute),
    );

    return popAndPushNamed(Routes.initialRoute);
  }
}

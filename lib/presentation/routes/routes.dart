import 'package:flutter/material.dart';

import '../screens/coopNetwork_screen/view/coopNetwork_screen.dart';
import '../screens/home_screen/view/home_screen.dart';
import '../screens/interest_rate_screen/view/interest_main_screen.dart';
import '../screens/intro_screen/view/intro_screen.dart';
import '../screens/login_screen/view/login_screen.dart';
import '../screens/not_found_screen/view/not_found_screen.dart';
import '../screens/user_info_screen/view/user_info_screen.dart';
import '../screens/share_dividen_screen/view/share_dividen_screen.dart';

// Screens
typedef RouteBuilder = Widget Function(BuildContext);

class Routes {
  const Routes._();

  static const String initialRoute = introScreenRoute; //appStartupScreenRoute;
  static const String fallbackRoute = notFoundScreenRoute;

  static const String introScreenRoute = '/intro-screen';
  static const String interRestRoute = '/interrest-screen';
  static const String appStartupScreenRoute = '/startup-screen';
  static const String coopNetworkScreenRoute = '/coopNetwork_screen';
  static const String homeScreenRoute = '/home_screen';
  static const String loginScreenRoute = '/login_screen';
  static const String userInfoScreenRoute = '/user_info_screen';
  static const String shareDividenScreenRoute = '/share_dividen_screen';

  static const String notFoundScreenRoute = '/not-found-screen';

  static final Map<String, RouteBuilder> _routesMap = {
    introScreenRoute: (_) => const IntroScreen(),
    userInfoScreenRoute: (_) => const UserInfoScreen(),
    shareDividenScreenRoute: (_) => const ShareDividenScreen(),
    interRestRoute: (_) => const InterestScreen(),
    loginScreenRoute: (_) => const LoginScreen(),
    homeScreenRoute: (_) => const HomeScreen(),
    coopNetworkScreenRoute: (_) => const CoopNetworkScreen(),
    notFoundScreenRoute: (_) => const NotFoundScreen(),
  };

  static RouteBuilder getRoute(String? routeName) {
    return routeExists(routeName)
        ? _routesMap[routeName]!
        : _routesMap[Routes.notFoundScreenRoute]!;
  }

  static bool routeExists(String? routeName) {
    return _routesMap.containsKey(routeName);
  }
}

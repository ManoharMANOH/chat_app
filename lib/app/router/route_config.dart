import 'package:chat_app/app/router/route_path.dart';
import 'package:chat_app/ui/screens/auth_screen.dart';
import 'package:chat_app/ui/screens/home_screen.dart';
import 'package:chat_app/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteConfig {
  RouteConfig._();
  static final _rootKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootKey,
    initialLocation: RoutePath.splash,
    routes: [
      GoRoute(
        path: RoutePath.splash,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SplashScreen());
        },
      ),
      GoRoute(
        path: RoutePath.auth,
        pageBuilder: (context, state) {
          return const MaterialPage(child: AuthScreen());
        },
      ),
      GoRoute(
        path: RoutePath.home,
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomeScreen());
        },
      ),
    ],
  );
}

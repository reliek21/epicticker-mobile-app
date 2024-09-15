import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:epicticker/presentation/screens/screens.dart';

abstract class MainRoutes {
  static const String home = '/';
  static const String newCountDown = '/new-countdown';
  static const String editCountDown = '/edit-countdown';
}

final GoRouter appRouter = GoRouter(
  initialLocation: MainRoutes.home,
  routes: <RouteBase>[
    GoRoute(
      path: MainRoutes.home,
      builder: (BuildContext context, GoRouterState state) => const HomeScreen()
    ),
    GoRoute(
      path: MainRoutes.newCountDown,
      builder: (BuildContext context, GoRouterState state) => const NewCountDownScreen()
    ),
    GoRoute(
      path: MainRoutes.editCountDown,
      builder: (BuildContext context, GoRouterState state) => const EditCountDownScreen(currentCountdown: null)
    ),
  ]
);

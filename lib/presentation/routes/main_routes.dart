import 'package:flutter/material.dart';
import 'package:epicticker/presentation/screens/edit_countdown_screen.dart';
import 'package:epicticker/presentation/screens/home_screen.dart';
import 'package:epicticker/presentation/screens/new_countdown_screen.dart';

class MainRoutes {
  MainRoutes._();

  static const String home = '/';
  static const String newCountDown = 'countdown';
  static const String editCountDown = 'edit';
}

Map<String, WidgetBuilder> mainRoutes() {
  return <String, WidgetBuilder>{
    MainRoutes.home: (BuildContext context) => const HomeScreen(),
    MainRoutes.newCountDown: (BuildContext context) => const NewCountDownScreen(),
    MainRoutes.editCountDown: (BuildContext context) => const EditCountDownScreen(currentCountdown: null),
  };
}

Route<Widget> createRouteBuilder(String route) {
  return PageRouteBuilder<Widget>(
    pageBuilder: (
			BuildContext context,
			Animation<double> animation,
			Animation<double> secondaryAnimation
		) {
      switch (route) {
        case MainRoutes.home:
          return const HomeScreen();
        case MainRoutes.newCountDown:
          return const NewCountDownScreen();
        case MainRoutes.editCountDown:
          return const EditCountDownScreen(currentCountdown: null);
        default:
          return Container();
      }
    },

    transitionsBuilder: (
			BuildContext context,
			Animation<double> animation,
			Animation<double> secondaryAnimation,
			Widget child
		) {
      const Offset begin = Offset(0.0, 1.0);
      const Offset end = Offset.zero;

      const Cubic curve = Curves.ease;

      final Tween<Offset> tween = Tween<Offset>(begin: begin, end: end);

      final CurvedAnimation curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

class ScreenRoute {
  ScreenRoute._();

  static Future<dynamic> screenView(BuildContext context, String route) {
    return Navigator.of(context).push(createRouteBuilder(route));
  }
}

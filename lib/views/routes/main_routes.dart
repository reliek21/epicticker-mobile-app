import 'package:flutter/material.dart';
import 'package:epicticker/views/screens/home_screen.dart';
import 'package:epicticker/views/screens/new_countdown_screen.dart';

class MainRoutes {
  MainRoutes._();

  static const String home = '/';
  static const String newCountDown = 'countdown';
}

Map<String, WidgetBuilder> getRoutes() {
  return {
    MainRoutes.home: (BuildContext context) => const HomeScreen(),
    MainRoutes.newCountDown: (BuildContext context) => const NewCountDownScreen()
  };
}

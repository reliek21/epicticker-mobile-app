import 'package:flutter/material.dart';
import 'package:epicticker/views/screens/home_screen.dart';

class MainRoutes {
  MainRoutes._();

  static const String home = '/';
}

Map<String, WidgetBuilder> getRoutes() {
  return {
    MainRoutes.home: (BuildContext context) => const HomeScreen()
  };
}

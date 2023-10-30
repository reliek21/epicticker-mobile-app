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

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    MainRoutes.home: (BuildContext context) => const HomeScreen(),
    MainRoutes.newCountDown: (BuildContext context) => const NewCountDownScreen(),
		MainRoutes.editCountDown: (BuildContext context) => const EditCountDownScreen(currentCountdown: null)
  };
}

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
    MainRoutes.home: (_) => const HomeScreen(),
    MainRoutes.newCountDown: (_) => const NewCountDownScreen(),
		MainRoutes.editCountDown: (_) => const EditCountDownScreen(currentCountdown: null)
  };
}

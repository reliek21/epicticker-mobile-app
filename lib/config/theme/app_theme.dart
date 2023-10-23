import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getTheme() => ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark
  );
}

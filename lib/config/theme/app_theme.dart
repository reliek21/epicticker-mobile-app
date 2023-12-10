import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData getTheme() => ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark
  );
}

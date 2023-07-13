import 'package:flutter/material.dart';
import 'package:epicticker/views/routes/main_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: MainRoutes.home,
      routes: getRoutes(),
      title: 'EpicTicker',
    );
  }
}

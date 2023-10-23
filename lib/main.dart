import 'package:flutter/material.dart';

import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'package:epicticker/config/theme/app_theme.dart';
import 'package:epicticker/presentation/provider/count_down_provider.dart';
import 'package:epicticker/presentation/routes/main_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<CountDownProvider>(create: (BuildContext context) => CountDownProvider())
      ],
      child: MaterialApp(
        title: 'EpicTicker',
        routes: getRoutes(),
        theme: AppTheme.getTheme(),
        initialRoute: MainRoutes.home,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

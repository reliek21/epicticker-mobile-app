import 'package:flutter/material.dart';

import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:epicticker/config/theme/app_theme.dart';
import 'package:epicticker/presentation/providers/crud/count_down_provider.dart';
import 'package:epicticker/presentation/routes/main_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<CountDownProvider>(create: (_) => CountDownProvider())
      ],
      child: MaterialApp(
        title: 'Epic Tracker',
        routes: mainRoutes(),
        theme: AppTheme.getTheme(),
        initialRoute: MainRoutes.home,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

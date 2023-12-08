import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import 'package:epicticker/config/config.dart';
import 'package:epicticker/infrastructure/datasources/local_countdown_datasource_impl.dart';
import 'package:epicticker/infrastructure/repositories/countdown_repository_impl.dart';
import 'package:epicticker/presentation/providers/crud/count_down_provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final CountdownRepositoryImpl countdownRepositoryImpl = CountdownRepositoryImpl(
      countdownDatasource: LocalCountdownDatasource()
    );

    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<CountDownProvider>(
            create: (_) => CountDownProvider(countdownRepository: countdownRepositoryImpl)
        )
      ],
      child: MaterialApp.router(
        title: 'Epic Tracker',
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: AppTheme.getTheme(),
      ),
    );
  }
}

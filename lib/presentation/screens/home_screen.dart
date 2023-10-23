import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:epicticker/presentation/provider/count_down_provider.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/presentation/routes/main_routes.dart';
import 'package:epicticker/presentation/widgets/day_left_card_widget.dart';
import 'package:epicticker/presentation/widgets/information_dash_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CountDownProvider>(context, listen: false).loadCountDowns();
  }


  Widget _body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(vertical: 46.0),
            child: const InformationDashWidget()
          ),
          Consumer<CountDownProvider>(
            builder: (BuildContext context, CountDownProvider countdownProvider, Widget? child) {
              final countdowns = countdownProvider.countDownList;

              if (countdowns.isEmpty) {
                return const Text('No countdowns yet.');
              }

              return Column(
                children: countdowns.map((coundown) {
                  return DayLeftCardWidget(
                    title: coundown.name,
                    year: coundown.year,
                    month: coundown.month,
                    day: coundown.day
                  );
                }).toList(),
              );
            }
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EpicTickerColors.primary,
      body: SafeArea(child: SingleChildScrollView(child: _body(context))),
      bottomNavigationBar: BottomAppBar(
        height: 63.0,
        color: EpicTickerColors.brown,
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: EpicTickerColors.brown,
        onPressed: () => Navigator.pushNamed(context, MainRoutes.newCountDown),
        tooltip: 'Add new day',
        child: const Icon(
          Icons.add,
          size: 24.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

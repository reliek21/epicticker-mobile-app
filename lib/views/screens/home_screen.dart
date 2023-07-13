import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/views/widgets/day_left_card_widget.dart';
import 'package:epicticker/views/widgets/information_dash_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          const DayLeftCardWidget(),
          const DayLeftCardWidget(),
          const DayLeftCardWidget(),
          const DayLeftCardWidget(),
          const DayLeftCardWidget(),
          const DayLeftCardWidget(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EpicTickerColors.primary,
      body: SafeArea(child: SingleChildScrollView(child: _body(context))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:epicticker/common/color.dart';
import 'package:epicticker/domain/entities/count_down_entity.dart';
import 'package:epicticker/presentation/provider/count_down_provider.dart';
import 'package:epicticker/presentation/widgets/dashboard_widget.dart';
import 'package:epicticker/presentation/widgets/day_left_card_widget.dart';
import 'package:epicticker/presentation/widgets/floating_button_widget.dart';

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

  Widget bodyContainer(BuildContext context) {
    return Container(
			padding: const EdgeInsets.symmetric(horizontal: 16.0),
			child: Column(
				children: <Widget>[
					const DashboardWidget(),
					Container(
						margin: const EdgeInsets.only(
							top: 24.0
						),
						child: Consumer<CountDownProvider>(
							builder: (BuildContext context, CountDownProvider countdownProvider, Widget? child) {
								final List<CountDownEntity> countdowns = countdownProvider.getRecentCountDownsByDays(20);

								if (countdowns.isEmpty) const Center(child: Text('No countdowns yet.'));

								return Container(
									margin: const EdgeInsets.only(bottom: 100.0),
									child: Column(
										children: countdowns.map((CountDownEntity countdown) {
											return DayLeftCardWidget(
												title: countdown.name,
												year: countdown.year,
												month: countdown.month,
												day: countdown.day
											);
										}).toList(),
									),
								);
							}
						),
					),
				],
			),
		);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EpicTickerColors.accent,
      body: SafeArea(child: SingleChildScrollView(child: bodyContainer(context))),
			floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
			floatingActionButton: const FloatingButtonWidget()
    );
  }
}

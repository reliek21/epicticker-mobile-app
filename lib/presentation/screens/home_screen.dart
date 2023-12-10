import 'package:flutter/material.dart';
import 'package:epicticker/utils/difference_date_util.dart';
import 'package:epicticker/utils/format_create_date.dart';
import 'package:provider/provider.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/domain/entities/count_down_entity.dart';
import 'package:epicticker/presentation/providers/crud/count_down_provider.dart';
import 'package:epicticker/presentation/screens/edit_countdown_screen.dart';
import 'package:epicticker/presentation/widgets/animation_limited_widget.dart';
import 'package:epicticker/presentation/widgets/chip_filter_widget.dart';
import 'package:epicticker/presentation/widgets/dashboard_widget.dart';
import 'package:epicticker/presentation/widgets/day_left_card_new_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<CountDownProvider>(context, listen: false).getAllCountdowns();
  }

  Widget bodyContainer(BuildContext context) {
		const SizedBox sizeWidth = SizedBox(width: 8.0);

    return Container(
    	padding: const EdgeInsets.symmetric(horizontal: 16.0),
    	child: Column(
    		children: <Widget>[
    			const DashboardWidget(),
					Container(
						margin: const EdgeInsets.symmetric(vertical: 20.0),
						child: Row(
							children: <Widget>[
								ChipFilterWidget(
									text: 'Active',
									isActive: false,
									onTap: () {},
								),
								sizeWidth,
								ChipFilterWidget(
									text: 'Archived',
									isActive: false,
									onTap: () {}
								),
								sizeWidth,
								ChipFilterWidget(
									text: 'Completed',
									isActive: true,
									onTap: () {}
								)
							],
						),
					),
    			Consumer<CountDownProvider>(
    				builder: (BuildContext context, CountDownProvider countdownProvider, Widget? child) {
    					final List<CountdownEntity> countdowns = countdownProvider.getRecentCountdownByDays();

    					if (countdowns.isEmpty) const Center(child: Text('No countdowns yet.'));

    					return Container(
    						margin: const EdgeInsets.only(bottom: 100.0),
    						child: Column(
    							children: countdowns.asMap().entries.map((MapEntry<int, CountdownEntity> entry) {
    								final int index = entry.key;
    								final CountdownEntity countdown = entry.value;

										DateDifference difference = calculateDateDifference(
											countdown.year,
											countdown.month,
											countdown.day,
										);

										double completionPercentage =
                      1.0 - (difference.years * 365 + difference.months * 30 + difference.days) / 365;

										completionPercentage = completionPercentage.clamp(0.0, 1.0);

    								return AnimationLimiterWidget(
    									position: index,
    									child: InkWell(
    										onTap: () {
    											CountdownEntity currentCountdown = countdown;

    											Navigator.push(
    												context,
    												MaterialPageRoute<CountdownEntity>(
    													builder: (_) => EditCountDownScreen(currentCountdown: currentCountdown)
    												)
    											);
    										},
    										child: DayLeftCardNewWidget(
													name: countdown.name,
													daysLeft: '${difference.years} years, ${difference.months} months, ${difference.days} days',
													createdAt: 'Target Date: ${formatCreatedAt(countdown.createdAt.toString())}',
													// targetDate: 'Target Date${countdown.day} ${SelectMonth.getShortMonthName(countdown.month)}, ${countdown.year}',
													completion: completionPercentage,
												)
    									),
    								);
    							}).toList(),
    						),
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
      backgroundColor: EpicTrackerColors.accent,
      body: SafeArea(
				child: ScrollConfiguration(
					behavior: const ScrollBehavior().copyWith(overscroll: true),
					child: SingleChildScrollView(child: bodyContainer(context))
				)
			),
			// floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
			// floatingActionButton: const FloatingButtonWidget()
    );
  }
}

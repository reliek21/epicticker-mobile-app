import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/domain/entities/count_down_entity.dart';
import 'package:epicticker/presentation/providers/count_down_provider.dart';
import 'package:epicticker/presentation/screens/edit_countdown_screen.dart';
import 'package:epicticker/presentation/widgets/animation_limited_widget.dart';
import 'package:epicticker/presentation/widgets/chip_filter_widget.dart';
import 'package:epicticker/presentation/widgets/dashboard/dashboard_widget.dart';
import 'package:epicticker/presentation/widgets/day_left_card/day_left_card_widget.dart';
import 'package:epicticker/utils/difference_date_util.dart';
import 'package:epicticker/utils/get_month_name.dart';
import 'package:epicticker/utils/time_remaining_format.dart';

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
    return Container(
    	padding: const EdgeInsets.symmetric(horizontal: 16.0),
    	child: Column(
    		children: <Widget>[
    			const DashboardWidget(),
					Container(
						margin: const EdgeInsets.symmetric(vertical: 20.0),
						child: _FilterChip(),
					),
    			_CardList(),
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
			)
    );
  }
}

class _CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CountDownProvider>(
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

    					return _Card(
								index: index,
								countdown: countdown,
								difference: difference,
								completionPercentage: completionPercentage
							);
    				}).toList(),
    			),
    		);
    	}
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.index,
    required this.countdown,
    required this.difference,
    required this.completionPercentage,
  });

  final int index;
  final CountdownEntity countdown;
  final DateDifference difference;
  final double completionPercentage;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiterWidget(
    	position: index,
    	child: InkWell(
    		onTap: () {
    			CountdownEntity currentCountdown = countdown;

					// TODO: change this for go router
    			Navigator.push(
    				context,
    				MaterialPageRoute<CountdownEntity>(
    					builder: (_) => EditCountDownScreen(currentCountdown: currentCountdown)
    				)
    			);
    		},
    		child: DayLeftCardWidget(
					// TODO: change this for title
					title: countdown.name,
					daysLeft: timeRemainingFormat(difference.years, difference.months, difference.days),
					targetDate: '${countdown.day} ${SelectMonth.getCompletedMonthName(countdown.month)}, ${countdown.year}',
					completion: completionPercentage,
				)
    	),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final SizedBox sizeWidth = const SizedBox(width: 8.0);

  @override
  Widget build(BuildContext context) {
    return Row(
    	children: <Widget>[
    		ChipFilterWidget(
    			text: 'Active',
    			isActive: false,
    			onTap: () {

					},
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
    );
  }
}

import 'package:epicticker/utils/format_create_date.dart';
import 'package:epicticker/utils/get_month_name.dart';
import 'package:flutter/material.dart';
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
    Provider.of<CountDownProvider>(context, listen: false).loadCountDowns();
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
    					final List<CountDownEntity> countdowns = countdownProvider.countDownList;

    					if (countdowns.isEmpty) const Center(child: Text('No countdowns yet.'));

    					return Container(
    						margin: const EdgeInsets.only(bottom: 100.0),
    						child: Column(
    							children: countdowns.asMap().entries.map((MapEntry<int, CountDownEntity> entry) {
    								final int index = entry.key;
    								final CountDownEntity countdown = entry.value;

    								return AnimationLimiterWidget(
    									position: index,
    									child: InkWell(
    										onTap: () {
    											CountDownEntity currentCountdown = countdown;

    											Navigator.push(
    												context,
    												MaterialPageRoute<CountDownEntity>(
    													builder: (_) => EditCountDownScreen(currentCountdown: currentCountdown)
    												)
    											);
    										},
    										child: DayLeftCardNewWidget(
													name: countdown.name,
													createAt: 'Created at ${formatCreatedAt(countdown.createdAt.toString())}',
													targetDate: 'Target for ${countdown.day} ${SelectMonth.getShortMonthName(countdown.month)}, ${countdown.year}',
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

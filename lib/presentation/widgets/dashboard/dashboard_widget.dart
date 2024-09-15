import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';
import 'package:epicticker/config/config.dart';
import 'package:epicticker/presentation/providers/count_down_provider.dart';
import 'package:epicticker/presentation/widgets/dashboard/notification_widget.dart';
import 'package:epicticker/presentation/widgets/primary_button_widget.dart';
import 'package:epicticker/utils/get_month_name.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
		final CountDownProvider countDownProvider = context.watch<CountDownProvider>();
		final String closestEvent = countDownProvider.getClosestEvent().name;

    return _DashboardBuilder(
			countDownProvider: countDownProvider,
			closestEvent: closestEvent
		);
  }
}

class _DashboardBuilder extends StatelessWidget {
  const _DashboardBuilder({
    required this.countDownProvider,
    required this.closestEvent,
  });

  final CountDownProvider countDownProvider;
  final String closestEvent;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DateTime?>(
      future: countDownProvider.getClosestDate(),
      builder: (BuildContext context, AsyncSnapshot<DateTime?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Container(
						margin: const EdgeInsets.only(top: 50.0),
						child: Center(
							child: PrimaryButtonWidget(
								text: 'Create new event',
								onPressed: () => context.push(MainRoutes.newCountDown)
							),
						),
					);
        } else {
          final DateTime closestDate = snapshot.data as DateTime;

          late String title = 'No events in the near future';
          late String subtitle = '';

          final DateTime now = DateTime.now();
          final Duration difference = closestDate.difference(now);

          if (difference.inDays == 0) {
            title = 'Today';
          } else if (difference.inDays == 1) {
            title = 'Tomorrow';
          } else {
            title = 'Next Event';
          }

          subtitle =
              '${SelectMonth.getWeekName(closestDate.weekday)}, ${closestDate.day} ${SelectMonth.getCompletedMonthName(closestDate.month)}';

          return _Dashboard(
						title: title,
						closestEvent: closestEvent,
						subtitle: subtitle
					);
        }
      },
    );
  }
}

class _Dashboard extends StatelessWidget {
  final String title;
  final String closestEvent;
  final String subtitle;

  const _Dashboard({
    required this.title,
    required this.closestEvent,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
			width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 24.0),
			padding: const EdgeInsets.symmetric(vertical: 20.0),
			decoration: BoxDecoration(
				border: Border.all(
					color: EpicTrackerColors.main,
					width: 2.0
				),
				borderRadius: BorderRadius.circular(20.0)
			),
      child: Column(
        children: <Widget>[
          Container(
						padding: const EdgeInsets.symmetric(horizontal: 20.0),
						child: Row(
							crossAxisAlignment: CrossAxisAlignment.start,
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: <Widget>[
								_EventInformation(title: title, closestEvent: closestEvent, subtitle: subtitle),
								_Notification()
							],
						),
					),
					Container(
						margin: const EdgeInsets.only(top: 14.0),
						child: _Button()
					),
        ],
      ),
    );
  }
}

class _EventInformation extends StatelessWidget {
  final String title;
  final String closestEvent;
  final String subtitle;

  const _EventInformation({
    required this.title,
    required this.closestEvent,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
    	crossAxisAlignment: CrossAxisAlignment.start,
    	children: <Widget>[
    		Text(title, style: EpicTrackerTextStyles.semiExtraHeading(
    				color: EpicTrackerColors.main,
						fontWeight: FontWeight.w900
					),
    		),
    		Text(closestEvent, style: EpicTrackerTextStyles.heading(
						fontWeight: FontWeight.w700,
						color: EpicTrackerColors.accentBlack
					),
    		),
    		Text(subtitle, style: EpicTrackerTextStyles.title(
						color: EpicTrackerColors.accentBlack,
						fontWeight: FontWeight.w700
					),
    		),
    	],
    );
  }
}

class _Notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const NotificationWidget(notification: true);
  }
}

class _Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
    	text: 'Create new event',
    	onPressed: () => context.push(MainRoutes.newCountDown)
    );
  }
}


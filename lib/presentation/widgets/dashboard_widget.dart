import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';
import 'package:epicticker/presentation/providers/crud/count_down_provider.dart';
import 'package:epicticker/presentation/routes/main_routes.dart';
import 'package:epicticker/presentation/widgets/primary_button_widget.dart';
import 'package:epicticker/utils/get_month_name.dart';
import 'package:epicticker/utils/get_week_name.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
		final CountDownProvider countDownProvider = Provider.of<CountDownProvider>(context);
		final String closestEvent = countDownProvider.getClosestEvent().name;

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
								onPressed: () => ScreenRoute.screenView(context, MainRoutes.newCountDown)
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
              '${getWeekName(closestDate.weekday)}, ${closestDate.day} ${getMonthName(closestDate.month)}';

          return Container(
						width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 24.0, bottom: 34.0),
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
								const SizedBox(height: 14.0),
								 PrimaryButtonWidget(
									text: 'Create new event',
									onPressed: () => ScreenRoute.screenView(context, MainRoutes.newCountDown)
								)
              ],
            ),
          );
        }
      },
    );
  }
}


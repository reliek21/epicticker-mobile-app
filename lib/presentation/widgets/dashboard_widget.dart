import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';
import 'package:epicticker/presentation/provider/count_down_provider.dart';
import 'package:epicticker/utils/get_month_name.dart';
import 'package:epicticker/utils/get_week_name.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
		const Text noEvents = Text('No upcoming events');

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
          return noEvents;
        } else {
          final DateTime closestDate = snapshot.data as DateTime;

          late String title = 'No upcoming events';
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
              '${getWeekName(closestDate.weekday)},${closestDate.day} ${getMonthName(closestDate.month)}';

          return Container(
            margin: const EdgeInsets.only(top: 24.0, bottom: 34.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 24.0),
                  child: Text(closestEvent, style: EpicTickerTextStyles.heading(
											fontWeight: FontWeight.w700,
											color: EpicTickerColors.accentBlack
										),
                  ),
                ),
                Text(subtitle, style: EpicTickerTextStyles.title(
										color: EpicTickerColors.accentBlack,
										fontWeight: FontWeight.w700
									),
                ),
                Text(title, style: EpicTickerTextStyles.extraHeading(
										color: EpicTickerColors.main,
										fontWeight: FontWeight.w900
									),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}


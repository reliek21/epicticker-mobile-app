import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';
import 'package:epicticker/presentation/provider/count_down_provider.dart';

String _getMonthName(int month) {
  // Puedes personalizar la obtención del nombre del mes según tus necesidades
  final months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  return months[month - 1];
}

String _getWeekName(int day) {
	final daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
	return daysOfWeek[day - 1];
}

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
		final CountDownProvider countDownProvider = Provider.of<CountDownProvider>(context);

    return FutureBuilder<DateTime?>(
      future: countDownProvider.getClosestDate(),
      builder: (BuildContext context, AsyncSnapshot<DateTime?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Puedes mostrar un indicador de carga o un mensaje mientras esperas la fecha.
          return CircularProgressIndicator(); // Por ejemplo
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data == null) {
          // No hay fechas próximas, muestra un mensaje apropiado.
          return Text('No upcoming events');
        } else {
          final DateTime closestDate = snapshot.data as DateTime;

          String title = 'No upcoming events';
          String subtitle = '';
					int closestDay = closestDate.day;

         if (closestDate != null) {
            final now = DateTime.now();
            final difference = closestDate.difference(now);

            if (difference.inDays == 0) {
              title = 'Today';
            } else if (difference.inDays == 1) {
              title = 'Tomorrow';
            } else {
              title = 'Next Event';
            }

            subtitle =
                '${_getWeekName(closestDate.weekday)}, ${closestDate.day} ${_getMonthName(closestDate.month)}';
          }

          return Container(
            margin: const EdgeInsets.only(top: 24.0, bottom: 34.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 24.0),
                  child: Text(
                    countDownProvider.getClosestEvent().name.toString(),
                    style:
                        EpicTickerTextStyles.heading(color: EpicTickerColors.accentBlack, fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  subtitle,
                  style: EpicTickerTextStyles.title(color: EpicTickerColors.accentBlack, fontWeight: FontWeight.w700),
                ),
                Text(
                  title,
                  style: EpicTickerTextStyles.extraHeading(color: EpicTickerColors.main, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}


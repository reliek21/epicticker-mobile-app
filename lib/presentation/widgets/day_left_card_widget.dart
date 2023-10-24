import 'package:epicticker/presentation/widgets/days_left_widget.dart';
import 'package:epicticker/utils/difference_date_util.dart';
import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';

class DayLeftCardWidget extends StatelessWidget {
  final String title;
  final int year;
  final int month;
  final int day;

  const DayLeftCardWidget({
    super.key,
    required this.title,
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
		final DateDifference leftDays = calculateDateDifference(year, month, day);

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
			padding: const EdgeInsets.symmetric(
				vertical: 16.0
			),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: EpicTickerColors.main,
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title, style: EpicTickerTextStyles.heading(
              color: EpicTickerColors.accent,
              fontWeight: FontWeight.bold
            ),
          ),
					Container(
						margin: const EdgeInsets.only(top: 10.0),
						child: Row(
							mainAxisAlignment: MainAxisAlignment.center,
						  children: <Widget>[
								if (leftDays.years > 1)
									Container(
										margin: const EdgeInsets.only(right: 22.0),
										child: DayLeftWidget(days: leftDays.years, text: year >= 1 ? 'Years' : 'Year')
									),

								if (leftDays.months > 1)
									Container(
										margin: const EdgeInsets.only(right: 22.0),
										child: DayLeftWidget(days: leftDays.months, text: month >= 1 ? 'Months' : 'Month')
									),

								if (leftDays.months > 1)
									DayLeftWidget(days: leftDays.days,text: day >= 1 ? 'Days' : 'Day'),
						  ],
						),
					)
        ],
      ),
    );
  }
}

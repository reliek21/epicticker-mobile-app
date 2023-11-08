import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';
import 'package:epicticker/presentation/widgets/days_left_widget.dart';
import 'package:epicticker/utils/difference_date_util.dart';

class DayLeftCardProgress extends StatelessWidget {
  final String title;
  final int year;
  final int month;
  final int day;

  const DayLeftCardProgress({
    super.key,
    required this.title,
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    final DateDifference leftDays = calculateDateDifference(year, month, day);

		final DateTime targetDate = DateTime(year, month, day);
    final DateTime now = DateTime.now();
    final DateTime startDate = DateTime(now.year, 1, 1);

    final int totalDays = targetDate.difference(startDate).inDays;
    final int elapsedDays = now.difference(startDate).inDays;

    final double progress = (elapsedDays / totalDays).clamp(0.0, 1.0);

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(width: 2.0, color: EpicTrackerColors.main),
        borderRadius: const BorderRadius.all(Radius.circular(10.0))
			),
      child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween	,
				crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: EpicTrackerTextStyles.heading(color: EpicTrackerColors.main, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(right: 22.0),
                        child: DayLeftWidget(days: leftDays.years, text: leftDays.years > 1 ? 'Years' : 'Year')),
                    Container(
                        margin: const EdgeInsets.only(right: 22.0),
                        child: DayLeftWidget(days: leftDays.months, text: leftDays.months > 1 ? 'Months' : 'Month')),
                    DayLeftWidget(days: leftDays.days, text: leftDays.days > 1 ? 'Days' : 'Day'),
                  ],
                ),
              )
            ],
          ),
					Stack(
						alignment: Alignment.center,
						children: <Widget>[
							SizedBox(
                width: 60.0,
                height: 60.0,
                child: CircularProgressIndicator(
                  value: progress,
                  backgroundColor: EpicTrackerColors.main,
                  valueColor: const AlwaysStoppedAnimation<Color>(EpicTrackerColors.secondary),
                  strokeWidth: 10.0,
                ),
              ),
							Text('${(progress * 100).toStringAsFixed(0)}%', style: EpicTrackerTextStyles.subTitle(),
							)
						],
					)
        ],
      ),
    );
  }
}

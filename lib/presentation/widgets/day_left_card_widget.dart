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
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      height: 107.0,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: EpicTickerColors.lightPink,
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: EpicTickerTextStyles.heading(
              color: EpicTickerColors.dark,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            calculateDateDifference(year, month, day),
            style: EpicTickerTextStyles.heading(
              color: EpicTickerColors.brown
            ),
          )
        ],
      ),
    );
  }
}

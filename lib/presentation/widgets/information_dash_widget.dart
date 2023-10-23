import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';

class InformationDashWidget extends StatelessWidget {
  const InformationDashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          '32 days',
          style: EpicTickerTextStyles.heading(
            color: EpicTickerColors.brown
          ),
        ),
        Text(
          'Monday, 25 Apr 03:30 p.m',
          style: EpicTickerTextStyles.heading(
            color: EpicTickerColors.brown
          ),
        ),
        Text(
          'Upcoming Day',
          style: EpicTickerTextStyles.extraHeading(
            color: EpicTickerColors.dark
          ),
        ),
      ],
    );
  }
}

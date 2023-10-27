import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';

class DashboardWidget extends StatelessWidget {
	const DashboardWidget({super.key});

	@override
	Widget build(BuildContext context) {
		return Container(
      margin: const EdgeInsets.only(top: 24.0, bottom: 34.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 24.0),
            child: Text(
              'Travel to Brazil',
              style: EpicTickerTextStyles.heading(
								color: EpicTickerColors.accentBlack,
								fontWeight: FontWeight.w700
							),
            ),
          ),
          Text(
            'Monday, 25 Apr 03:30 p.m',
            style: EpicTickerTextStyles.title(
							color: EpicTickerColors.accentBlack,
							fontWeight: FontWeight.w700
						),
          ),
          Text(
            'Upcoming Day',
            style: EpicTickerTextStyles.extraHeading(
							color: EpicTickerColors.main,
							fontWeight: FontWeight.w900
						),
          ),
        ],
      ),
    );
	}
}

import 'package:flutter/material.dart';

import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';

class DayLeftWidget extends StatelessWidget {
	final int days;
	final String text;

	const DayLeftWidget({super.key, required this.days, required this.text});

	@override
	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				Container(
					width: 40.0,
					height: 40.0,
					decoration: BoxDecoration(
						border: Border.all(
							color: EpicTickerColors.main,
							width: 1.5
						),
						borderRadius: BorderRadius.circular(10.0)
					),
					child: Center(
						child: Text(days.toString(), style: EpicTickerTextStyles.title(
							color: EpicTickerColors.main,
							fontWeight: FontWeight.w900
						),

						)
					),
				),
				const SizedBox(height: 4.0),
				Text(text, style: EpicTickerTextStyles.subTitle(
						color: EpicTickerColors.main,
						fontWeight: FontWeight.w600
					),
				)
			],
		);
	}
}

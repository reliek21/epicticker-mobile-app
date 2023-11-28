import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';
import 'package:flutter/material.dart';

class DayLeftCardNewWidget extends StatelessWidget {
	final String name;
	final String createAt;
	final String targetDate;

	const DayLeftCardNewWidget({
		super.key,
		required this.name,
		required this.createAt,
		required this.targetDate
	});

	@override
	Widget build(BuildContext context) {
		return Container(
			width: MediaQuery.of(context).size.width,
			padding: const EdgeInsets.symmetric(
				vertical: 14.0,
				horizontal: 16.0
			),
			margin: const EdgeInsets.only(bottom: 10.0),
			decoration: BoxDecoration(
				border: Border.all(
					width: 3.0,
					color: EpicTrackerColors.main
				),
				borderRadius: BorderRadius.circular(20.0)
			),
			child: Column(
				children: <Widget>[
					Row(
						crossAxisAlignment: CrossAxisAlignment.center,
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							Text(
								name,
								style: EpicTrackerTextStyles.heading(
									color: EpicTrackerColors.main,
									fontWeight: FontWeight.w900
								),
							),
							IconButton(
								onPressed: () { },
								icon: const Icon(
									size: 24.0,
									color: EpicTrackerColors.main,
									BootstrapIcons.three_dots_vertical,
								)
							)
						],
					),
					Container(
						margin: const EdgeInsets.only(
							top: 7.0,
							bottom: 6.0
						),
						child: Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: <Widget>[
								Text(
									createAt,
									style: EpicTrackerTextStyles.caption(
										fontWeight: FontWeight.w900,
										color: EpicTrackerColors.main.withOpacity(0.5)
									),
								),
								Text(
									targetDate,
									style: EpicTrackerTextStyles.caption(
										fontWeight: FontWeight.w900,
										color: EpicTrackerColors.secondary
									),
								)
							],
						),
					),
					Stack(
						children: <Widget>[
							Container(
								width: MediaQuery.of(context).size.width,
								height: 12.0,
								decoration: BoxDecoration(
									color: EpicTrackerColors.main,
									borderRadius: BorderRadius.circular(10.0)
								),
							),
							Container(
								width: MediaQuery.of(context).size.width / 4,
								height: 12.0,
								decoration: BoxDecoration(
									color: EpicTrackerColors.secondary,
									borderRadius: BorderRadius.circular(10.0)
								),
							)
						],
					),
					Row(
						mainAxisAlignment: MainAxisAlignment.end,
						children: <Widget>[
							Container(
								margin: const EdgeInsets.only(top: 6.0),
								child: Text(
									'50%',
									style: EpicTrackerTextStyles.caption(fontWeight: FontWeight.w900),
								),
							)
						],
					)
				],
			),
		);
	}
}

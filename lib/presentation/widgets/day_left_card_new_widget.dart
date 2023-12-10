import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';
import 'package:flutter/material.dart';

class DayLeftCardNewWidget extends StatelessWidget {
	final String name;
	final String createdAt;
	final String daysLeft;
	// final String targetDate;
	final double completion;

	const DayLeftCardNewWidget({
		super.key,
		required this.name,
		required this.createdAt,
		required this.daysLeft,
		// required this.targetDate,
		required this.completion
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
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Row(
						crossAxisAlignment: CrossAxisAlignment.center,
						mainAxisAlignment: MainAxisAlignment.start,
						children: <Widget>[
							Container(
								width: 50.0,
								height: 50.0,
								decoration: BoxDecoration(
									color: EpicTrackerColors.secondary,
									borderRadius: BorderRadius.circular(5.0)
								),
								child: const Icon(
									BootstrapIcons.activity,
									size: 24.0,
									color: EpicTrackerColors.accent,
								),
							),
							const SizedBox(width: 8.0),
							SizedBox(
								width: 200.0,
								child: Text(
									name,
									style: EpicTrackerTextStyles.heading(
										color: EpicTrackerColors.main,
										fontWeight: FontWeight.w900
									),
									maxLines: 2,
									softWrap: true,
									overflow: TextOverflow.ellipsis,
								),
							),
							const Spacer(),
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
					const SizedBox(height: 10.0),
					RichText(
						text: TextSpan(
							text: 'Time remaining: ',
							style: EpicTrackerTextStyles.title(
								fontWeight: FontWeight.w900,
								color: EpicTrackerColors.main
							),
							children: <TextSpan>[
								TextSpan(
									text: daysLeft,
									style: EpicTrackerTextStyles.title(
										fontWeight: FontWeight.w700,
										color: EpicTrackerColors.main.withOpacity(0.5)
									),
								),
							],
						),
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
									createdAt,
									style: EpicTrackerTextStyles.title(
										color: EpicTrackerColors.main.withOpacity(0.5)
									),
								),
							],
						),
					),
					// Container(
					// 	margin: const EdgeInsets.only(bottom: 4.0),
					// 	child: Row(
					// 		mainAxisAlignment: MainAxisAlignment.center,
					// 		children: <Widget>[
					// 			Text(
					// 				targetDate,
					// 				style: EpicTrackerTextStyles.title(
					// 					fontWeight: FontWeight.w900,
					// 					color: EpicTrackerColors.secondary
					// 				),
					// 			),
					// 		],
					// 	),
					// ),
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
								width: MediaQuery.of(context).size.width * completion,
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
									'${(completion * 100).toInt()}%',
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

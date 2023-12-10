import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';
import 'package:epicticker/presentation/widgets/day_left_card/progress_bar.dart';

class DayLeftCardWidget extends StatelessWidget {
	final String title;
	final String daysLeft;
	final String targetDate;
	final double completion;

	const DayLeftCardWidget({
		super.key,
		required this.title,
		required this.daysLeft,
		required this.targetDate,
		required this.completion
	});

	@override
	Widget build(BuildContext context) {
		return Container(
			width: MediaQuery.of(context).size.width,
			padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
			margin: const EdgeInsets.only(bottom: 10.0),
			decoration: BoxDecoration(
				border: Border.all(width: 3.0, color: EpicTrackerColors.main),
				borderRadius: BorderRadius.circular(20.0)
			),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					_CardHeader(title: title),
					Container(
						margin: const EdgeInsets.only(top: 10.0, bottom: 2.0),
						child: _TimeRemaining(daysLeft: daysLeft)
					),
					Container(
						margin: const EdgeInsets.only(bottom: 10.0),
						child: _TargetDate(targetDate: targetDate)
					),
					ProgressBarWidget(completion: completion),
				],
			),
		);
	}
}

class _TimeRemaining extends StatelessWidget {
  final String daysLeft;

  const _TimeRemaining({required this.daysLeft});

  @override
  Widget build(BuildContext context) {
    return RichText(
    	text: TextSpan(
    		text: 'Time remaining: ',
    		style: EpicTrackerTextStyles.subTitle(
    			fontWeight: FontWeight.w900,
    			color: EpicTrackerColors.main
    		),
    		children: <TextSpan>[
    			TextSpan(
    				text: daysLeft,
    				style: EpicTrackerTextStyles.subTitle(
    					fontWeight: FontWeight.w700,
    					color: EpicTrackerColors.main.withOpacity(0.5)
    				),
    			),
    		],
    	),
    );
  }
}

class _TargetDate extends StatelessWidget {
  final String targetDate;
	// TODO: create selection of color
  const _TargetDate({required this.targetDate});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
          text: 'Target Date: ',
          style: EpicTrackerTextStyles.subTitle(
						fontWeight: FontWeight.w900,
						color: EpicTrackerColors.main
					),
          children: <TextSpan>[
            TextSpan(
              text: targetDate,
              style: EpicTrackerTextStyles.subTitle(
								fontWeight: FontWeight.w700,
								color: EpicTrackerColors.secondary
							),
            ),
          ],
        ),
      );
  }
}

class _CardHeader extends StatelessWidget {
  final String title;
	// TODO: create property to select icon
	// TODO: create property to select color

  const _CardHeader({required this.title});

	Container icon() {
		return Container(
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
		);
	}

	SizedBox headerTitle() {
		return SizedBox(
			width: 200.0,
			child: Text(
				title,
				maxLines: 2,
				softWrap: true,
				overflow: TextOverflow.ellipsis,
				style: EpicTrackerTextStyles.heading(
					color: EpicTrackerColors.main,
					fontWeight: FontWeight.w900
				),
			),
		);
	}

	IconButton optionsButton() {
		return IconButton(
			onPressed: () { },
			icon: const Icon(
				BootstrapIcons.three_dots_vertical,
				color: EpicTrackerColors.main,
				size: 24.0,
			)
		);
	}

  @override
  Widget build(BuildContext context) {
    return Row(
			crossAxisAlignment: CrossAxisAlignment.center,
    	mainAxisAlignment: MainAxisAlignment.spaceBetween,
    	children: <Widget>[
    			icon(),
    			Container(
						margin: const EdgeInsets.only(left: 8.0),
						child: headerTitle()
					),
    			optionsButton()
    	],
    );
  }
}

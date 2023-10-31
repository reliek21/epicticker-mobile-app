import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';
import 'package:flutter/material.dart';

class ToolTipWidget extends StatelessWidget {
	final String message;
	final Widget child;

	const ToolTipWidget({super.key, required this.message, required this.child});

	@override
	Widget build(BuildContext context) {
		return Tooltip(
			margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
				borderRadius: BorderRadius.circular(20.0),
				color: EpicTrackerColors.main
			),
      textStyle: EpicTrackerTextStyles.caption(color: EpicTrackerColors.accent),
      message: message,
			child: child,
		);
	}
}

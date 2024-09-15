import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';
import 'package:flutter/material.dart';

class ChipFilterWidget extends StatelessWidget {
	final String text;
	final bool isActive;
	final void Function()? onTap;

	const ChipFilterWidget({
		super.key,
		this.onTap,
		required this.text,
		required this.isActive
	});

	@override
	Widget build(BuildContext context) {
		return InkWell(
			onTap: onTap,
			child: Container(
				width: 110.0,
				height: 35.0,
				decoration: BoxDecoration(
					color: isActive ? EpicTrackerColors.main : Colors.transparent,
					border: Border.all(
						color: !isActive ? EpicTrackerColors.main : Colors.transparent,
						width: 2.0
					),
					borderRadius: BorderRadius.circular(20.0)
				),
				child: Center(
					child: Text(text, style: EpicTrackerTextStyles.subTitle(
							color: isActive
								? EpicTrackerColors.accent
								: EpicTrackerColors.main,
							fontWeight: FontWeight.w800
						),
					),
				),
			),
		);
	}
}

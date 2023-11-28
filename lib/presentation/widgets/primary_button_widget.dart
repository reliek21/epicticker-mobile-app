import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';

class PrimaryButtonWidget extends StatelessWidget {
	final String text;
	final void Function()? onPressed;

	const PrimaryButtonWidget({
		super.key,
		required this.text,
		required this.onPressed
	});

	@override
	Widget build(BuildContext context) {
		return OutlinedButton(
			onPressed: onPressed,
			child: Container(
				width: MediaQuery.of(context).size.width,
        height: 56.0,
        decoration: BoxDecoration(
					color: EpicTrackerColors.secondary,
					borderRadius: BorderRadius.circular(20.0)
				),
				child: Row(
					mainAxisAlignment: MainAxisAlignment.center,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: <Widget>[
						const Icon(BootstrapIcons.plus_circle,
							color: EpicTrackerColors.accent,
							size: 24.0,
						),
						const SizedBox(width: 12.0),
						Text(text, style: EpicTrackerTextStyles.title(
							color: EpicTrackerColors.accent,
							fontWeight: FontWeight.w700
						))
					],
				),
			),
		);
	}
}

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';

class ShowDialogWidget {
	final BuildContext context;
	final void Function()? onPressed;

	ShowDialogWidget({
		required this.context,
		required this.onPressed
	});

	Future<void> deleteDialog() {
		return showDialog(
			context: context,
			builder: (BuildContext context) => AlertDialog(
				backgroundColor: EpicTrackerColors.accent,
				title: const Row(
					crossAxisAlignment: CrossAxisAlignment.center,
					children: <Widget>[
						Icon(
							BootstrapIcons.trash,
							color: EpicTrackerColors.intensePink,
							size: 24.0,
						),
						SizedBox(width: 12.0),
						Text('Delete Event'),
					],
				),
				titleTextStyle: EpicTrackerTextStyles.heading(
						fontWeight: FontWeight.bold
					),
				content: const Text('Are you sure you want to delete this event?'),
				contentTextStyle: EpicTrackerTextStyles.title(),
				actions: <Widget>[
					TextButton(
						onPressed: () => Navigator.pop(context),
						child: Text('Abort', style: EpicTrackerTextStyles.subTitle(
								color: EpicTrackerColors.main
							)
						)
					),
					TextButton(
						onPressed: onPressed,
						child: Text('Delete', style: EpicTrackerTextStyles.subTitle(
								color: EpicTrackerColors.intensePink
							)
						)
					),

				],
			)
		);
	}
}

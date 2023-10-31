import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/presentation/routes/main_routes.dart';
import 'package:epicticker/presentation/widgets/tooltip_widget.dart';

class FloatingButtonWidget extends StatelessWidget {
	const FloatingButtonWidget({super.key});

	@override
	Widget build(BuildContext context) {
		return Container(
			width: 260.0,
			height: 60.0,
			decoration: BoxDecoration(
				color: EpicTrackerColors.main,
				borderRadius: BorderRadius.circular(100),
			),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					ToolTipWidget(
						message: 'Create a new event',
						child: InkWell(
							onTap: () => Navigator.pushNamed(context, MainRoutes.newCountDown),
							child: Container(
								width: 40.0,
								height: 40.0,
								decoration: BoxDecoration(
									color: EpicTrackerColors.accent,
									borderRadius: BorderRadius.circular(100.0)
								),
								child: const Icon(
									BootstrapIcons.plus,
									color: EpicTrackerColors.main,
								),
							),
						),
					),
				],
			),
		);
	}
}

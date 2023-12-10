import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:epicticker/common/color.dart';

class NotificationWidget extends StatelessWidget {
	final bool notification;
	final void Function()? onTap;

	const NotificationWidget({
		super.key,
		required this.notification,
		this.onTap
	});

	@override
	Widget build(BuildContext context) {
		return InkWell(
			onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: EpicTrackerColors.main.withOpacity(0.1),
							borderRadius: BorderRadius.circular(100.0)
						),
            child: const Icon(
              BootstrapIcons.bell_fill,
              size: 28.0,
              color: EpicTrackerColors.main,
            ),
          ),
          Positioned(
            right: 12.0,
            top: 10.0,
            child: Container(
              width: 12.0,
              height: 12.0,
              decoration: BoxDecoration(
								color: notification ? EpicTrackerColors.secondary : Colors.transparent,
								borderRadius: BorderRadius.circular(100.0)
							),
            ),
          )
        ],
      ),
    );
	}
}

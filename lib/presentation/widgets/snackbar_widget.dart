import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';

class ReusableSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    String? actionLabel,
    Function? onActionPressed,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: EpicTrackerColors.main,
				behavior: SnackBarBehavior.floating,
        content: Text(message, style: EpicTrackerTextStyles.title(
						color: EpicTrackerColors.accent,
						fontWeight: FontWeight.w400
					),
        ),
        action: SnackBarAction(
          textColor: EpicTrackerColors.accent,
          label: actionLabel ?? 'Undo',
          onPressed: onActionPressed as void Function()? ?? () {},
        ),
      ),
    );
  }
}

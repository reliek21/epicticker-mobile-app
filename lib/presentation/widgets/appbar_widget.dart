import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';

class AppBarWidget {
	AppBarWidget._();

	static PreferredSizeWidget? appBar(BuildContext context, String title) {
		return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.arrow_back,
          color: EpicTrackerColors.main,
        ),
      ),
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: EpicTrackerTextStyles.heading(color: EpicTrackerColors.main, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: EpicTrackerColors.accent,
      elevation: 0.0,
    );
	}
}

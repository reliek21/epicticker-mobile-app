import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';

class OutlineButtonWidget extends StatelessWidget {
  final String text;
  final bool? fillButton;
	final Color outlineColor;
  final void Function()? onPressed;

  const OutlineButtonWidget({
		super.key,
		this.fillButton = false,
		required this.text,
		required this.onPressed,
		this.outlineColor = EpicTrackerColors.main
	});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: (fillButton == false) ? Colors.transparent : EpicTrackerColors.main,
        border: (fillButton == false) ? Border.all(color: outlineColor) : null,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
            outlineColor.withOpacity(0.10),
          ),
        ),
        child: Text(
          text,
          style: EpicTrackerTextStyles.title(
            color: (fillButton != false) ? EpicTrackerColors.accent : outlineColor,
            fontWeight: FontWeight.bold
          ),
        )
      ),
    );
  }
}

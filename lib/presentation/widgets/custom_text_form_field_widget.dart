import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String hintText;
	final void Function()? onTap;
	final TextInputType? keyboardType;
  final TextEditingController controller;
	final String? initialValue;

  const CustomTextFormFieldWidget({
		super.key,
		required this.hintText,
		this.onTap,
		this.keyboardType = TextInputType.name,
		required this.controller,
		this.initialValue
	});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: EpicTrackerColors.main.withOpacity(0.20),
        ),
        borderRadius: BorderRadius.circular(8.0),
        color: EpicTrackerColors.main.withOpacity(0.10),
      ),
      child: Center(
        child: TextFormField(
					keyboardType: keyboardType,
          controller: controller,
					initialValue: initialValue,
          style: EpicTrackerTextStyles.title(color: EpicTrackerColors.main),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: EpicTrackerTextStyles.title(color: EpicTrackerColors.main),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(16.0),
          ),
					onTap: onTap,
        ),
      ),
    );
  }
}

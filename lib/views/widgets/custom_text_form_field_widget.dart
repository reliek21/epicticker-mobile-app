import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextFormFieldWidget({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: EpicTickerColors.brown.withOpacity(0.20),
        ),
        borderRadius: BorderRadius.circular(8.0),
        color: EpicTickerColors.brown.withOpacity(0.10),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          style: EpicTickerTextStyles.title(color: EpicTickerColors.brown),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: EpicTickerTextStyles.title(color: EpicTickerColors.brown),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(16.0),
          ),
        ),
      ),
    );
  }
}

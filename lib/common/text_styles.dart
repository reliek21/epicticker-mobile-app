import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';

const String fontFamily = 'Nunito';

class EpicTrackerTextStyles {
  EpicTrackerTextStyles._();

  static TextStyle extraHeading({
    double? height,
    bool underline = false,
    Color color = EpicTrackerColors.accentBlack,
    FontWeight fontWeight = FontWeight.w700,
  }) => TextStyle(
    color: color,
    fontSize: 34.0,
    height: height,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    decoration: underline ? TextDecoration.underline : null
  );

  static TextStyle semiExtraHeading({
    double? height,
    bool underline = false,
    Color color = EpicTrackerColors.accentBlack,
    FontWeight fontWeight = FontWeight.w600,
  }) => TextStyle(
    color: color,
    fontSize: 22.0,
    height: height,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    decoration: underline ? TextDecoration.underline : null
  );

  static TextStyle heading({
    double? height,
    bool underline = false,
    Color color = EpicTrackerColors.accentBlack,
    FontWeight fontWeight = FontWeight.w600,
  }) => TextStyle(
    color: color,
    fontSize: 20.0,
    height: height,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    decoration: underline ? TextDecoration.underline : null
  );

  static TextStyle title({
    double? height,
    bool underline = false,
    Color color = EpicTrackerColors.accentBlack,
    FontWeight fontWeight = FontWeight.w600,
  }) => TextStyle(
    color: color,
    fontSize: 17.0,
    height: height,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    decoration: underline ? TextDecoration.underline : null
  );

  static TextStyle subTitle({
    double? height,
    bool underline = false,
    Color color = EpicTrackerColors.accentBlack,
    FontWeight fontWeight = FontWeight.w600,
  }) => TextStyle(
    color: color,
    fontSize: 14.0,
    height: height,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    decoration: underline ? TextDecoration.underline : null
  );

  static TextStyle caption({
    double? height,
    bool underline = false,
    Color color = EpicTrackerColors.accentBlack,
    FontWeight fontWeight = FontWeight.w400,
  }) => TextStyle(
    color: color,
    fontSize: 12.0,
    height: height,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    decoration: underline ? TextDecoration.underline : null
  );
}

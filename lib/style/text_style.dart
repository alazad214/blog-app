import 'package:flutter/material.dart';

import '../utils/colors.dart';

TextStyle AppTextStyle1(
    {Color? textColor, FontWeight? fontWeight, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 22,
    color: textColor ?? AppColor.black,
    fontWeight: fontWeight ?? FontWeight.bold,
    fontFamily: "robotomono",
  );
}

TextStyle AppTextStyle2(
    {Color? textColor, FontWeight? fontWeight, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 13,
    color: textColor ?? Colors.black.withOpacity(0.6),
    fontWeight: fontWeight ?? FontWeight.bold,
    fontFamily: "robotomono",
  );
}

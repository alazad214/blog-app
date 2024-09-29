import 'package:flutter/material.dart';

import '../style/text_style.dart';
import '../utils/colors.dart';

class SmallButton extends StatelessWidget {
  const SmallButton(
      {super.key,
      this.text,
      this.bgcolor,
      this.color,
      this.fontWeight,
      this.width,
      this.ontap});
  final text;
  final bgcolor;
  final color;
  final fontWeight;
  final width;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          width: width,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              color: bgcolor ?? AppColor.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            text,
            style: AppTextStyle2(
                fontWeight: FontWeight.bold, textColor: Colors.black54),
          )),
    );
  }
}

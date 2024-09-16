import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final bool? isBorder;
  final bool? isLoading;
  final width;
  final bgcolor;
  final textcolor;

  const AppButton({
    super.key,
    required this.text,
    this.onTap,
    this.isBorder,
    this.isLoading,
    this.width,
    this.bgcolor,
    this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: bgcolor ?? AppColor.secondary,
          border: isBorder == true ? Border.all(color: AppColor.primary) : null,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: isLoading == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          color: isBorder == true
                              ? AppColor.primary
                              : Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              : Center(
                  child: Text(
                    text,
                    style: TextStyle(
                        color: textcolor ?? Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
        ),
      ),
    );
  }
}

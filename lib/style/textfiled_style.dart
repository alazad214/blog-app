import 'package:flutter/material.dart';
import 'package:praner_blog/utils/colors.dart';

InputDecoration appInputDecoration({
  hinttext,
  prefixIcon,
  VoidCallback? ontap,
}) {
  return InputDecoration(
    hintText: hinttext ?? ' ',

    filled: true,
    fillColor: Colors.black12,
    suffixIcon: Icon(Icons.search, color: AppColor.secondary, size: 32),
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    // Enable border
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.black12, width: 0.1),
    ),
    // Focus border
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black12, width: 0.1),
      borderRadius: BorderRadius.circular(12.0),
    ),
    // Error border
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  );
}

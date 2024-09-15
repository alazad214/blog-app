import 'package:flutter/material.dart';

InputDecoration appInputDecoration({
  hinttext,
  prefixIcon,
  VoidCallback? ontap,
}) {
  return InputDecoration(
    hintText: hinttext ?? ' ',
    prefixIcon: ontap != null
        ? IconButton(
            onPressed: ontap,
            icon: Icon(prefixIcon),
          )
        : Icon(prefixIcon),
    filled: true,
    fillColor: Colors.white,

    // Enable border
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: Colors.blue, width: 1),
    ),
    // Focus border
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(14.0),
    ),
    // Error border
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(14.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(14.0),
    ),
  );
}

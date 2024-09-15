import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:praner_blog/utils/colors.dart';

successToast(msg) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.secondary,
      textColor: Colors.white,
      fontSize: 16.0);
}

errorToast(msg) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

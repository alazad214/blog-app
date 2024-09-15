import 'package:flutter/material.dart';

ButtonStyle AppButtonStyle() {
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
    backgroundColor: Colors.teal,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    textStyle: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
  );
}

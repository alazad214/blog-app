import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_post_Textfield extends StatelessWidget {
  const Custom_post_Textfield(
      {super.key, required this.hinttext, required this.maxline});

  final String hinttext;
  final int maxline;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      margin: const EdgeInsets.only(left: 10, right: 20, top: 10),
      child: TextField(
        maxLines: maxline,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: hinttext,
          filled: true,
          fillColor: Colors.white,
          //enable-->
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.black, width: 0.1),
          ),

          //focus-->
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
                color:
                    Colors.blue), // Set border color when the field is focused
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Custom_TextField extends StatelessWidget {
  const Custom_TextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.send,
                color: Colors.blue,
              )),
          hintText: "Send message...",
          filled: true,
          fillColor: Colors.white,
          //enable-->
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),

          //focus-->
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color:
                    Colors.blue), // Set border color when the field is focused
          ),
        ),
      ),
    );
  }
}

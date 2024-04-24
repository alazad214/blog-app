import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praner_blog/widgets/custom_textfield.dart';

class message_Mobile extends StatelessWidget {
  const message_Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(),
        Text(
          "mobile Connected",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        Custom_TextField(),
        SizedBox(height: 20),
      ],
    );
  }
}

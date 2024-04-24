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
        Custom_TextField(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Any articles and comments published on BlogRider are available online and are not owned by BlogRider.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
        SizedBox(height: 20),

      ],
    );
  }
}

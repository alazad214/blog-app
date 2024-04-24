import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_textfield.dart';

class Message_Desktop extends StatelessWidget {
  const Message_Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(),
        SizedBox(
          width: 400,
          child: Custom_TextField(),
        ),
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

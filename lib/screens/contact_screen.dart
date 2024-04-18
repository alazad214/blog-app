import 'package:flutter/material.dart';
import 'package:praner_blog/screens/fottersection.dart';

class Contact_Screen extends StatelessWidget {
  const Contact_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Policy"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Fotter_Section()
          ],
        ),
      ),
    );
  }
}

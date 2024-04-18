import 'package:flutter/material.dart';

class Header_Drawer extends StatelessWidget {
  const Header_Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: ListView(children: [
        const SizedBox(height: 20),
        Align(
            child: Container(
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close)),
        )),
      ]),
    );
  }
}

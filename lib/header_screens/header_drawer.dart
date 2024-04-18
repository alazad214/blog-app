import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/screens/contact_screen.dart';
import 'package:praner_blog/screens/policy.dart';

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
        _CustomListTile("Home", Icons.home, () {
          Navigator.of(context).pop();
        }),
        _CustomListTile("Contact", Icons.mail, () {
          Get.to(() => const Contact_Screen());
        }),
        _CustomListTile("Policy", Icons.privacy_tip_rounded, () {
          Get.to(() => const Policy_Screen());
        }),
      ]),
    );
  }
}

Widget _CustomListTile(text, icon, ontap) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.black,
      size: 25,
    ),
    title: Text(
      text,
      style: const TextStyle(fontSize: 15),
    ),
    onTap: ontap,
  );
}

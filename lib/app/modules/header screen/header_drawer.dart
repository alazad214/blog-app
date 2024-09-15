import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:praner_blog/utils/colors.dart';

import '../contact/contact_screen.dart';
import '../policy/policy.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: AppColor.bgColor,
      width: size.width / 1.5,
      child: ListView(children: [
        SizedBox(height: 20),
        CircleAvatar(
          backgroundColor: AppColor.secondary,
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: Colors.white,
              )),
        ),
        SizedBox(height: 10),
        Divider(),
        drawerTile("Home", Iconsax.home, () {
          Navigator.of(context).pop();
        }),
        drawerTile("Contact", Icons.email_outlined, () {
          Get.to(() => const ContactScreen());
        }),
        drawerTile("Policy", Icons.privacy_tip_outlined, () {
          Get.to(() => const PolicyScreen());
        }),
      ]),
    );
  }
}

Widget drawerTile(text, icon, ontap) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.black,
      size: 25,
    ),
    title: Text(
      text,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    onTap: ontap,
  );
}

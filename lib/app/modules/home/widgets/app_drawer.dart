import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:praner_blog/app/modules/add%20blog/add_blog_screen.dart';
import 'package:praner_blog/app/modules/auth/logout_dialog.dart';
import 'package:praner_blog/utils/colors.dart';
import 'package:praner_blog/widgets/app_button.dart';
import 'package:praner_blog/widgets/app_dialog.dart';
import '../../../../style/text_style.dart';
import '../../policy/policy.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});
  final currentUser = FirebaseAuth.instance.currentUser;

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
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ' Blog',
              style: AppTextStyle1(
                  fontWeight: FontWeight.w500, textColor: Colors.black54),
            ),
            Text(
              ' Rider',
              style: AppTextStyle1(
                  fontWeight: FontWeight.w500, textColor: AppColor.secondary),
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(),

        ///Home....
        drawerTile("Home", Iconsax.home, () {
          Navigator.of(context).pop();
        }),

        ///App Policy...
        drawerTile("Policy", Icons.privacy_tip_outlined, () {
          Get.to(() => const PolicyScreen());
        }),

        ///Create Blog...
        drawerTile("Create Blog", Icons.add_circle_outline_sharp, () {
          if (currentUser == null) {
            appDialog(context);
          } else {
            Get.to(() => AddBlogScreen());
          }
        }),
        SizedBox(height: 20),

        ///Logout Button>>>>
        if (currentUser == null)
          SizedBox()
        else
          TextButton(
              onPressed: () {
                logoutDialog(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Logout  ",
                    style: AppTextStyle1(fontSize: 16),
                  ),
                  const Icon(
                    Icons.logout,
                    size: 20.0,
                    color: Colors.blue,
                  )
                ],
              )),
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

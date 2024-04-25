import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:praner_blog/screens/post_screen.dart';

import '../screens/search_screen.dart';

class Header_Mobile extends StatelessWidget {
  const Header_Mobile({super.key, required this.ontap});
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(left: 20, bottom: 0, right: 10, top: 0),
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(8)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => const Post_Screen());
              },
              child: Container(
                height: 30,
                padding: const EdgeInsets.only(
                    left: 5, right: 15, top: 2, bottom: 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blueGrey)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 10, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Icon(Icons.post_add), Text("Create blog..")],
                  ),
                ),
              ),
            ),
            const Spacer(),
            CircleAvatar(
              backgroundColor: Colors.black12,
              child: IconButton(
                  onPressed: ontap,
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

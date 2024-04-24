import 'package:flutter/material.dart';
import 'package:praner_blog/blog_card/blogcard_desktop.dart';
import 'package:praner_blog/blog_card/blogcard_mobile.dart';
import 'package:praner_blog/header_screens/header_desktop.dart';
import 'package:praner_blog/header_screens/header_mobile.dart';
import 'package:praner_blog/screens/fottersection.dart';

import '../header_screens/header_drawer.dart';
import '../sliders_screen/slider_desktop.dart';
import '../sliders_screen/slider_mobile.dart';

class Home_Screen extends StatelessWidget {
  Home_Screen({super.key});
  final headerkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constaints) {
      return Scaffold(
        backgroundColor: Colors.white,
        key: headerkey,
        endDrawer: constaints.maxWidth >= 600 ? null : const Header_Drawer(),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //header section------>
                    if (constaints.maxWidth >= 650)
                      const Header_Desktop()
                    else
                      Header_Mobile(ontap: () {
                        headerkey.currentState!.openEndDrawer();
                      }),
                    const SizedBox(height: 20),
                    //Slider section------>
                    if (constaints.maxWidth >= 650)
                      const Slider_Desktop()
                    else
                      const Slider_Mobile(),

                    //blogs section------>
                    const SizedBox(height: 20),
                    if (constaints.maxWidth >= 640)
                      BlogCard_Desktop()
                    else
                      BlogCard_Mobile(),

                    const SizedBox(height: 40),

                    const Fotter_Section()
                  ],
                ),
              )),
        ),
      );
    });
  }
}

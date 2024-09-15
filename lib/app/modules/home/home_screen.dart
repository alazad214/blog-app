import 'package:flutter/material.dart';
import '../blog card/blogcard_desktop.dart';
import '../blog card/blogcard_mobile.dart';
import '../header screen/header_desktop.dart';
import '../header screen/header_drawer.dart';
import '../header screen/header_mobile.dart';
import '../fotter/fottersection.dart';
import '../slider/slider_desktop.dart';
import '../slider/slider_mobile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final headerkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constaints) {
      return Scaffold(
        backgroundColor: Colors.white70,
        key: headerkey,
        endDrawer: constaints.maxWidth >= 600 ? null : const HeaderDrawer(),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //header section...
                    if (constaints.maxWidth >= 650)
                      const HeaderDesktop()
                    else
                      HeaderMobile(ontap: () {
                        headerkey.currentState!.openEndDrawer();
                      }),
                    const SizedBox(height: 20),
                    //Slider section...
                    if (constaints.maxWidth >= 650)
                      const SliderDesktop()
                    else
                      const SliderMobile(),

                    //blogs section...
                    const SizedBox(height: 20),
                    if (constaints.maxWidth >= 640)
                      BlogCardDesktop()
                    else
                      BlogCardMobile(),

                    const SizedBox(height: 40),

                    const FotterSection()
                  ],
                ),
              )),
        ),
      );
    });
  }
}

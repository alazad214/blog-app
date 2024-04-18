import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'home_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(Home_Screen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        Container(
          height: screenSize.height / 1,
          alignment: Alignment.center,
          child: Center(
              child: Lottie.asset("assets/animations/anim.json", height: 100)),
        )
      ],
    ));
  }
}

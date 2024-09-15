import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/utils/app_config.dart';
import '../tabbar/tabbar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(TabbarScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child:
                  Image.asset(AppConfig.appLogo, height: screenSize.height / 5))
        ],
      ),
    ));
  }
}

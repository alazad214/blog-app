import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:praner_blog/app/modules/home/widgets/custom_slider.dart';
import '../../../../utils/colors.dart';
import '../../blog/widgets/add_home_card.dart';
import '../../blog/widgets/blog_card.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final headerkey = GlobalKey<ScaffoldState>();
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constaints) {
      return Scaffold(
        backgroundColor: AppColor.bgColor,
        key: headerkey,
        drawer: AppDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                if (currentUser == null) SizedBox() else PostInputWidget(),
                SizedBox(height: 30),
                CustomSlider(),
                SizedBox(height: 30),
                BlogCard(),
              ],
            ),
          ),
        ),
      );
    });
  }
}

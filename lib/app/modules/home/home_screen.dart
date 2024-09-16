import 'package:flutter/material.dart';
import 'package:praner_blog/app/modules/blog/blog_card.dart';
import 'package:praner_blog/style/textfiled_style.dart';
import '../../../utils/colors.dart';
import '../blog card/blogcard_desktop.dart';
import '../blog card/blogcard_mobile.dart';
import '../header screen/header_drawer.dart';
import '../fotter/fottersection.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final headerkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constaints) {
      return Scaffold(
        backgroundColor: AppColor.bgColor,
        key: headerkey,
        endDrawer: constaints.maxWidth >= 600 ? null : const AppDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                TextFormField(
                  decoration: appInputDecoration(
                      hinttext: 'Search Blogs', suffixicon: Icons.search),
                ),
                SizedBox(height: 30),
                BlogCard(),
                SizedBox(height: 30),
                if (constaints.maxWidth >= 640)
                  BlogCardDesktop()
                else
                  BlogCardMobile(),
                const SizedBox(height: 40),
                const FotterSection()
              ],
            ),
          ),
        ),
      );
    });
  }
}

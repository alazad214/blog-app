import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:praner_blog/app/modules/header%20screen/header_drawer.dart';
import 'package:praner_blog/app/modules/home/home_screen.dart';
import 'package:praner_blog/style/text_style.dart';
import 'package:praner_blog/utils/colors.dart';

class TabbarScreen extends StatelessWidget {
  TabbarScreen({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(
            ' Blog Rider',
            style: AppTextStyle1(),
          ),
          backgroundColor: AppColor.bgColor,
          actions: [
            IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
                icon: CircleAvatar(
                    backgroundColor: AppColor.secondary,
                    child: Icon(Icons.menu, color: Colors.white)))
          ],
          bottom: TabBar(
            dividerColor: AppColor.white,
            indicatorColor: Colors.transparent,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                icon: FaIcon(
                  FontAwesomeIcons.home,
                ),
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.newspaper),
              ),
              Tab(icon: Icon(Icons.add_circle_outline_sharp, size: 30)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            Center(child: Text('Content of Tab 2')),
            Center(child: Text('Content of Tab 3')),
          ],
        ),
        endDrawer: AppDrawer(),
      ),
    );
  }
}

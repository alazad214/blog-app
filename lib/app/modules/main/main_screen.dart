import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:praner_blog/app/modules/add%20blog/add_blog_screen.dart';
import 'package:praner_blog/app/modules/category/views/blog_category.dart';
import 'package:praner_blog/app/modules/home/widgets/app_drawer.dart';
import 'package:praner_blog/app/modules/home/views/home_screen.dart';
import 'package:praner_blog/style/text_style.dart';
import 'package:praner_blog/utils/colors.dart';

import '../search/search_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                ' Blog',
                style: AppTextStyle1(fontWeight: FontWeight.w500),
              ),
              Text(
                ' Rider',
                style: AppTextStyle1(
                    fontWeight: FontWeight.w500, textColor: AppColor.secondary),
              ),
            ],
          ),
          backgroundColor: AppColor.bgColor,
          leading: IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(Icons.menu)),
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
              Tab(icon: FaIcon(FontAwesomeIcons.search)),
            ],
          ),
        ),
        body: TabBarView(
          children: [HomeScreen(), CategoryScreen(), SearchScreen()],
        ),
        drawer: AppDrawer(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:praner_blog/app/modules/category/components/category_card.dart';
import 'package:praner_blog/app/modules/category/views/category_blog_screen.dart';
import 'package:praner_blog/utils/colors.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('category').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No categories found.'));
          }

          final data = snapshot.data!.docs;
          return SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  'Discover blogs from the categories you love.',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20),
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => CategoryBlogScreen(
                                category: data[index]['name'],
                              ));
                        },
                        child: CategoryCard(
                          text: data[index]['name'],
                        ),
                      );
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}

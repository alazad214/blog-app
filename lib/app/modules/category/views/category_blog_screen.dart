import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../style/text_style.dart';
import '../../../../utils/colors.dart';
import '../../blog/views/blog_detials.dart';

class CategoryBlogScreen extends StatelessWidget {
  final String category;

  const CategoryBlogScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,  appBar: AppBar(
      title: Text(
        "Add blog",
        style: AppTextStyle2(),
      ),
    ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('blogs')
            .where('topic', isEqualTo: category)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data?.docs ?? [];

          if (data.isEmpty) {
            return Center(child: Text('No blogs found in this category.'));
          }

          return ListView.builder(
            padding: EdgeInsets.all(15),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final blog = data[index].data() as Map<String, dynamic>?;

              if (blog == null) {
                return Container();
              }

              final String title = blog['title'] as String? ?? 'Untitled Blog';
              final String author =
                  blog['author'] as String? ?? 'Unknown Author';
              final String image =
                  blog['image'] as String? ?? 'assets/image/news.png';

              return InkWell(
                onTap: () => Get.to(() => BlogDetials(blog: blog)),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 120,
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 2.8,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Image.network(image, fit: BoxFit.cover),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: AppTextStyle1(fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            Text(
                              author,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: AppTextStyle2(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

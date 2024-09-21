import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/app/modules/blog/blog_detials.dart';
import 'package:praner_blog/style/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:praner_blog/widgets/shimmer.dart';
import '../../business logic/controllers/blog_controller.dart';

class BlogCard extends StatelessWidget {
  BlogCard({super.key});
  final blogController = Get.put(BlogController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('blogs').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Shimmer());
        }
        final blogs = snapshot.data!.docs;
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: blogs.length,
          itemBuilder: (_, index) {
            final blog = blogs[index];
            return InkWell(
              onTap: () => Get.to(() => BlogDetials(
                    blog: blogs[index],
                  )),
              child: Container(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 120,
                          width: size.width / 2.5,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6)),
                          child: blog['image'] != null
                              ? Image.network(blog['image'], fit: BoxFit.cover)
                              : Image.asset('assets/image/news.png',
                                  fit: BoxFit.cover),
                        ),
                        Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              blog['created_at'] != null &&
                                      blog['created_at'] is Timestamp
                                  ? blogController
                                      .formatDate(blog['created_at'])
                                  : 'Unknown Date',
                              style: AppTextStyle2(textColor: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            blog['title'] ?? 'Untitled Blog',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: AppTextStyle1(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            blog['description'] ?? 'Unknown Author',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTextStyle2(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

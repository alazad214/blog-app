import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/app/modules/blog/blog_detials.dart';
import 'package:praner_blog/style/text_style.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 5,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () => Get.to(() => BlogDetials()),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
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
                          child: Image.asset('assets/image/news.png',
                              fit: BoxFit.cover)),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            '2 Feb, 24',
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
                            'News publishers sound alarm on Google’s new AI-infused search, warn of ‘catastrophic’ impacts',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: AppTextStyle1(fontSize: 16)),
                        SizedBox(height: 20),
                        Text('Daily Ettefaq',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: AppTextStyle2()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

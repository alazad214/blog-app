import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/utils/blog_item.dart';

import '../details_blog/details_mobile.dart';

class BlogCard_Mobile extends StatelessWidget {
  BlogCard_Mobile({super.key});

  final controller = Get.put(BlogController());
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: [
        for (int i = 0; i < controller.Blog_Item.length; i++)
          InkWell(
            onTap: () {
              Get.to(Details_Mobile(blogItem: controller.Blog_Item[i]));
            },
            child: Container(
              height: 240,
              width: 300,
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    controller.Blog_Item[i]["image"],
                    height: 150,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.timer,
                          size: 18,
                          color: Colors.white60,
                        ),
                        Expanded(
                          child: Text(
                            controller.Blog_Item[i]["time"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white60,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(
                          Icons.person,
                          size: 18,
                          color: Colors.white60,
                        ),
                        Expanded(
                          child: Text(
                            controller.Blog_Item[i]["Auther"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white60,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      controller.Blog_Item[i]["title"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}

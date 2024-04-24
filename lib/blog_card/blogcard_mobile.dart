import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/utils/blog_item.dart';
import 'package:praner_blog/widgets/custom_card.dart';

import '../details_blog/details_mobile.dart';

class BlogCard_Mobile extends StatelessWidget {
  BlogCard_Mobile({super.key});

  final controller = Get.put(BlogController());
  @override
  Widget build(BuildContext context) {
    return Custom_Card();
  }
}

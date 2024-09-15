import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/utils/blog_item.dart';

import '../../../widgets/custom_card.dart';

class BlogCardMobile extends StatelessWidget {
  BlogCardMobile({super.key});

  final controller = Get.put(BlogController());
  @override
  Widget build(BuildContext context) {
    return CustomCard();
  }
}

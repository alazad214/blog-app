import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/widgets/custom_card.dart';

import '../../../utils/blog_item.dart';

class BlogCardDesktop extends StatelessWidget {
  BlogCardDesktop({super.key});
  final controller = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constaints) {
      return Center(
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: CustomCard()),
      );
    });
  }
}

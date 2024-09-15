import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:praner_blog/style/toast_style.dart';

import '../../../style/text_style.dart';
import '../../../utils/colors.dart';

class BlogDetials extends StatelessWidget {
  const BlogDetials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        title: Text('Find More'),
        backgroundColor: AppColor.bgColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(6)),
                    child: Image.asset('assets/image/news.png')),
                Positioned(
                  top: 5,
                  right: 5,
                  child: CircleAvatar(
                    backgroundColor: AppColor.secondary,
                    child: IconButton(
                        onPressed: () {
                          successToast('Comming Soon');
                        },
                        icon: Icon(Icons.share, color: Colors.white)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
                'News publishers sound alarm on Google’s new AI-infused search, warn of ‘catastrophic’ impacts',
                style: AppTextStyle1(fontSize: 18)),
            Text('- Al Azad',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: AppTextStyle2(textColor: Colors.blue)),
            SizedBox(height: 30),
            Text(
                'Google on Tuesday announced that it will infuse its ubiquitous search engine with its powerful artificial intelligence model, Gemini, drawing on the rapidly advancing technology to directly answer user queries at the top of results pages. “Google will do the Googling for you,” the company explained. In other words, users will soon no longer have to click on the links displayed in search results to find the information they are seeking.',
                style: AppTextStyle2()),
          ],
        ),
      ),
    );
  }
}

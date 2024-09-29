import 'package:flutter/material.dart';
import 'package:praner_blog/style/toast_style.dart';
import '../../../../style/text_style.dart';
import '../../../../utils/colors.dart';

class BlogDetials extends StatelessWidget {
  final dynamic blog;
  const BlogDetials({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        title: Text(
          "Blog details",
          style: AppTextStyle2(),
        ),
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
                  child: blog['image'] != null
                      ? Image.network(blog['image'], fit: BoxFit.cover)
                      : Image.asset('assets/image/news.png', fit: BoxFit.cover),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: CircleAvatar(
                    backgroundColor: AppColor.secondary,
                    child: IconButton(
                      onPressed: () {
                        successToast('Coming Soon');
                      },
                      icon: Icon(Icons.share, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(blog['title'] ?? 'Untitled Blog',
                style: AppTextStyle1(fontSize: 18)),
            SizedBox(height: 10),
            Text(blog['author'] ?? 'Unknown Author',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: AppTextStyle2(textColor: Colors.blue)),
            SizedBox(height: 30),
            Text(blog['description'] ?? 'No description available',
                style: AppTextStyle2()),
          ],
        ),
      ),
    );
  }
}

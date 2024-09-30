import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
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
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: AppColor.secondary,
                    child: IconButton(
                      onPressed: () {
                        _showShareDialog(context);
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

  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Share'),
          content: Text('What would you like to share?'),
          actions: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Share.share(
                      'Check out this app: https://alazad214.netlify.app/');
                  Navigator.of(context).pop();
                },
                child: Text('Share App'),
              ),
            )
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/app/modules/add%20blog/add_blog_screen.dart';

class PostInputWidget extends StatelessWidget {
  const PostInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => AddBlogScreen());
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/icon/add.png'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Text(
                    'Add your blog..',
                    style: TextStyle(color: Colors.black54),
                  )),
                  Icon(
                    Icons.photo,
                    color: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

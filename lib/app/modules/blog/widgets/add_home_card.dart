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
        color: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Add your blog..",
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.topic_outlined,
                      color: Colors.redAccent,
                    ),
                    label: const Text(
                      'Topics',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.photo,
                      color: Colors.green,
                    ),
                    label: const Text(
                      'Photos',
                      style: TextStyle(color: Colors.black),
                    ),
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

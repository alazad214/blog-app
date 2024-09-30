import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/app/logic/controllers/search_controller.dart';
import 'package:praner_blog/app/modules/blog/views/blog_detials.dart';

class BlogSearchScreen extends StatelessWidget {
  final controller = Get.put(BlogSearchController());
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              controller.searchBlogs(value);
            },
            decoration: InputDecoration(
              hintText: 'Search by blog title',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade200),
                  borderRadius: BorderRadius.circular(8)),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  controller.searchBlogs('');
                  searchController.clear();
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            if (controller.blogs.isEmpty) {
              return Center(child: Text('No blogs found.'));
            }

            return ListView.builder(
              itemCount: controller.blogs.length,
              itemBuilder: (context, index) {
                var blog = controller.blogs[index];
                return InkWell(
                  onTap: () {
                    Get.to(() => BlogDetials(blog: blog));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.network(blog['image'] ?? ''),
                      title: Text(
                        blog['title'] ?? 'Untitled Blog',
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(blog['topic'] ?? 'Unknown Author',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      onTap: () {},
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}

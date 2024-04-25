import 'package:flutter/material.dart';
import 'package:praner_blog/widgets/cutom_post_textfield.dart';

class Post_Screen extends StatelessWidget {
  const Post_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create blog"),
        titleSpacing: 0,
        backgroundColor: Colors.white70,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.upload,
                color: Colors.blue,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            const Custom_post_Textfield(hinttext: " title...", maxline: 1),
            const Custom_post_Textfield(hinttext: "Description...", maxline: 6),
            const Custom_post_Textfield(hinttext: "email...", maxline: 1),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.image,
                  color: Colors.green,
                  size: 45,
                )),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  // Elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Upload now "), Icon(Icons.upload)],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

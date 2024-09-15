import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:praner_blog/widgets/cutom_post_textfield.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final ImagePicker picker = ImagePicker();
  XFile? image;
  List<XFile>? images;
  formGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

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
            image == null
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                : Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2)),
                    child: ClipRect(
                      child: Image.file(
                        File(image!.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            const Divider(),
            const Custom_post_Textfield(hinttext: " title...", maxline: 1),
            const Custom_post_Textfield(hinttext: "Description...", maxline: 6),
            const Custom_post_Textfield(hinttext: "email...", maxline: 1),
            IconButton(
                onPressed: () {
                  formGallery();
                },
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

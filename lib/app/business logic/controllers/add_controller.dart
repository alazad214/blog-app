import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class BlogPostController extends GetxController {
  var selectedTopic = ''.obs;
  var selectedImage = Rxn<File>();
  var isLoading = false.obs;

  List<String> topics = ["Technology", "Lifestyle", "Health", "Education"];

  void setTopic(String topic) {
    selectedTopic.value = topic;
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  Future<void> saveBlogPost(
      String title, String description, String author) async {
    if (selectedImage.value == null || selectedTopic.value.isEmpty) {
      throw Exception('Image or topic is missing');
    }

    try {
      isLoading.value = true; // Set loading state to true
      final storeImage = FirebaseStorage.instance
          .ref()
          .child('blog_images/${DateTime.now().millisecondsSinceEpoch}.png');
      final uploadTask = storeImage.putFile(selectedImage.value!);
      final snapshot = await uploadTask;
      final imageUrl = await snapshot.ref.getDownloadURL();

      var blogs = FirebaseFirestore.instance.collection('blogs');
      final blogData = {
        'title': title,
        'description': description,
        'author': author,
        'topic': selectedTopic.value,
        'image': imageUrl,
        'created_at': FieldValue.serverTimestamp(),
      };

      await blogs.add(blogData);
    } catch (e) {
      throw Exception('Something went wrong');
    } finally {
      isLoading.value = false; // Set loading state to false
    }
  }
}

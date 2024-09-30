import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlogSearchController extends GetxController {
  var searchQuery = ''.obs;
  var blogs = [].obs;
  var isLoading = false.obs;

  void searchBlogs(String query) async {
    searchQuery.value = query.trim();
    if (searchQuery.isEmpty) {
      blogs.clear();
      return;
    }

    try {
      isLoading.value = true;

      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('blogs')
          .where('title', isGreaterThanOrEqualTo: searchQuery.value)
          .where('title', isLessThanOrEqualTo: '${searchQuery.value}\uf8ff')
          .get();

      blogs.value = snapshot.docs.map((doc) => doc.data()).toList();
    } finally {
      isLoading.value = false;
    }
  }
}

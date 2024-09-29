import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  // Define your category list as an observable
  var categories = <Category>[].obs;
  var isLoading = true.obs; // Observable for loading state

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // Function to fetch categories from Firebase Firestore
  Future<void> fetchCategories() async {
    try {
      isLoading(true); // Start loading
      var categoryCollection =
          FirebaseFirestore.instance.collection('category');

      // Fetch data from Firestore
      var querySnapshot = await categoryCollection.get();

      // Convert the data into Category model objects
      var categoryList = querySnapshot.docs.map((doc) {
        return Category.fromFirestore(doc);
      }).toList();

      // Update the categories list
      categories.value = categoryList;
    } catch (e) {
      print('Error fetching categories: $e');
    } finally {
      isLoading(false); // Stop loading
    }
  }
}

// Category Model
class Category {
  final String id;
  final String name;
  final String imageUrl;
  final String description;

  Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
  });

  // Factory constructor to create a Category from Firestore document
  factory Category.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Category(
      id: doc.id,
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      description: data['description'] ?? '',
    );
  }
}

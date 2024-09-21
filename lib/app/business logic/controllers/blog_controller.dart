import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlogController extends GetxController {
  // Timestamp কে readable date string এ convert করার function
  String formatDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();  // Timestamp থেকে DateTime তৈরি হচ্ছে।
    return '${dateTime.day} ${getMonthName(dateTime.month)}, ${dateTime.year}';  // DateTime থেকে day, month, year নিয়ে format করা হচ্ছে।
  }

  // Month এর number কে name এ convert করার function
  String getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];  // Month number দিয়ে month এর নাম নেয়া হচ্ছে।
  }
}

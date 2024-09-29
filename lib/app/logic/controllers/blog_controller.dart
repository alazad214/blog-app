import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlogController extends GetxController {
  String formatDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return '${dateTime.day} ${getMonthName(dateTime.month)}, ${dateTime.year}';
  }

  String getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}

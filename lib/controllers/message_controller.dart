import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Message_Controller extends GetxController {
  RxString message = RxString("");

  SendMessage() async {
    await FirebaseFirestore.instance
        .collection("messages")
        .doc(message.value)
        .collection("message")
        .add({"sendmessage": message.value});
    Get.snackbar("succes", "Successfully send message");
  }
}

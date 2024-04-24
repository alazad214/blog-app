import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/controllers/message_controller.dart';

class Custom_TextField extends StatelessWidget {
  Custom_TextField({super.key});
  final TextEditingController messagecontroller = TextEditingController();

  final controller = Get.put(Message_Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        controller: messagecontroller,
        maxLines: 1,
        onChanged: (message) {
          controller.message.value = message;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                if (messagecontroller.text.isNotEmpty) {
                  controller.SendMessage();
                  messagecontroller.clear();
                }
              },
              icon: const Icon(
                Icons.send,
                color: Colors.blue,
              )),
          hintText: "Send message...",
          filled: true,
          fillColor: Colors.white,
          //enable-->
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),

          //focus-->
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color:
                    Colors.blue), // Set border color when the field is focused
          ),
        ),
      ),
    );
  }
}

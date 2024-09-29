import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/app_button.dart';
import '../../logic/controllers/auth_controller.dart';

void logoutDialog(BuildContext context) {
  final controller = Get.put(AuthController());
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 20,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.deepOrangeAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Image.asset('assets/icon/login.png', height: 80),
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                "Logout",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              // Subtitle
              Text(
                '''Are you sure you want to log out? You will need to log in again to access your account.
                ''',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Cancel button
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 10),

                  // Logout button
                  AppButton(
                    text: 'Logout',
                    onTap: () {
                      controller.signOut();
                    },
                    bgcolor: Colors.redAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

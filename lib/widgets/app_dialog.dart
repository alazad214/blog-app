import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/app/modules/auth/login_screen.dart';

import 'app_button.dart';

void appDialog(BuildContext context) {
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
                "Conitune Login",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              // Subtitle
              Text(
                '''
                Please enter your username and password to continue.If you don’t have an account, you can sign up or reset your password.
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
                    text: 'Continue',
                    onTap: () {
                      Get.to(() => SignInScreen());
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

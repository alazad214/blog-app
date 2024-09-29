import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/utils/input_validation.dart';
import '../../../../widgets/app_button.dart';
import '../../../utils/app_image.dart';
import '../../logic/controllers/auth_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImage.appLogo, width: screenSize.width / 2.5),
                const SizedBox(height: 15),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///email...
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: InputValidator.requeridField,
                          onChanged: (value) {
                            controller.email.value = value;
                          },
                          decoration:
                              const InputDecoration(labelText: "Email*")),
                      const SizedBox(height: 15),

                      ///Password textfield...
                      TextFormField(
                          obscureText: true,
                          validator: InputValidator.requeridField,
                          onChanged: (value) {
                            controller.password.value = value;
                          },
                          decoration:
                              const InputDecoration(labelText: "Password*")),

                      const SizedBox(height: 20),

                      ///signin button....
                      AppButton(
                          text: 'Sign In',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              controller.logIn();
                            }
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

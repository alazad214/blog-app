import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:praner_blog/app/modules/add%20blog/add_blog_screen.dart';
import 'package:praner_blog/app/modules/main/main_screen.dart';

import '../../../../style/toast_style.dart';

class AuthController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  ///Instance...
  final auth = FirebaseAuth.instance;
  final users = FirebaseAuth.instance.currentUser;

  logIn() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          Get.to(AddBlogScreen());
          successToast('Successfully Login');
        }
      });
    } on FirebaseAuthException catch (error) {
      errorToast(error);
    }
  }

  signOut() async {
    try {
      await auth.signOut().then((value) {
        Get.offAll(MainScreen());
        successToast('Successfully Logout');
      });
    } on FirebaseAuthException catch (e) {
      errorToast(e);
    }
  }
}

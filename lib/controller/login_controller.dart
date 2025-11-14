import 'package:chat_app/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isloading = false.obs;

  void login(String email, String password) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try {
      isloading.value = true;
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isloading.value = false;
      Get.showSnackbar(
        GetSnackBar(
          title: "Success",
          message: "Successfully Login",
          duration: Duration(seconds: 1),
        ),
      );
      Get.to(() => HomePage());
    } catch (e) {
      isloading.value = false;
      Get.showSnackbar(
        GetSnackBar(
          title: "Error",
          message: e.toString(),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }
}

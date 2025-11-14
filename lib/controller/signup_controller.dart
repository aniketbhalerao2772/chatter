import 'package:chat_app/pages/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;
  void signUp(String email, String password, String name) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      isLoading.value = true;
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      auth.currentUser?.updateDisplayName(name);
      isLoading.value = false;
      Get.showSnackbar(
        GetSnackBar(
          title: "Success",
          message: "SuccessFully SignUp",
          duration: Duration(seconds: 1),
        ),
      );
      Get.to(() => LandingPage());
    } catch (e) {
      isLoading.value = false;
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

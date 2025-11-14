
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  RxBool isloading = false.obs;

  RxList messages = [].obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  void sentMessage(String messageText) async {
    var message = firebaseFirestore.collection("messages");

    try {
      await message.add({
        "userName": auth.currentUser!.displayName,
        "message": messageText,
        "time": DateTime.now().toString(),
        "email": auth.currentUser!.email,
      });
    } catch (e) {
      print("error $e");
    }
  }
}

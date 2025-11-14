import 'package:chat_app/controller/message_controller.dart';

import 'package:chat_app/widgets/message_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController messageTextController = TextEditingController();
  final MessageController messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String formatedTime(String time) {
      DateTime date = DateTime.parse(time);
      return DateFormat('hh:mm a').format(date);
    }

    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.deepPurple,
          child: Column(
            children: [
              Text(
                "Chatter",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "by Aniket",
                style: TextStyle(color: Colors.deepPurple, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("messages")
                .orderBy("time")
                .snapshots(),
            builder: (context, asyncSnapshot) {
              print(asyncSnapshot.data!.docs);
              if (asyncSnapshot.hasError) {
                return Text("Unable to Fetched The Data");
              }
              if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              if (!asyncSnapshot.hasData) {
                return Text("No Data");
              }

              final docs = asyncSnapshot.data!.docs;

              return Expanded(
                child: ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    var message = docs[index];

                    return MessageText(
                      userType: auth.currentUser!.email == message["email"],
                      userName: message["userName"],
                      message: message["message"],
                      time: formatedTime(message["time"]),
                    );
                  },
                ),
              );
            },
          ),

          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 226, 224, 224),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: messageTextController,
              decoration: InputDecoration(
                label: Text("Type a message"),
                suffixIcon: InkWell(
                  onTap: () {
                    messageController.sentMessage(messageTextController.text);
                    messageTextController.clear();
                  },
                  child: Icon(Icons.send),
                ),

                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

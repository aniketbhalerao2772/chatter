import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/signup_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset('assets/Share.json'),

          Text(
            "Chatter",
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          DefaultTextStyle(
            style: const TextStyle(fontSize: 20.0),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  "WORLS'S MOST PRIVATE CHATTING APP ",
                  textStyle: TextStyle(color: Colors.deepPurple, fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          CustomButton(
            active: false,
            onTap: () {
              Get.to(() => LoginPage());
            },
            title: "LOGIN",
            borderCol: Colors.deepPurple,
            textCol: Colors.deepPurple,
            buttonCol: Colors.white,
          ),
          CustomButton(
            active: false,
            onTap: () {
              Get.to(() => SignUpPage());
            },
            title: "SIGNUP",
            borderCol: Colors.deepPurple,
            textCol: const Color.fromARGB(255, 255, 255, 255),
            buttonCol: Colors.deepPurple,
          ),

          SizedBox(height: 130),

          Text("Made with ❤️ by Aniket"),
        ],
      ),
    );
  }
}

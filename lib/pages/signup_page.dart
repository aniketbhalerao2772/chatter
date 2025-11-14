import 'package:chat_app/Pages/login_page.dart';
import 'package:chat_app/controller/signup_controller.dart';

import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final size = MediaQuery.of(context).size;

    final SignUpController signUpController = Get.put(SignUpController());

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(Icons.message, color: Colors.deepPurpleAccent, size: 120),

              Text(
                "Chatter",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextField(
                prefixIcons: Icons.text_format,
                title: "Name",
                controller: nameController,
              ),
              CustomTextField(
                prefixIcons: Icons.email,
                title: "E-mail",
                controller: emailController,
              ),
              CustomTextField(
                prefixIcons: Icons.lock,
                suffixIcons: Icons.remove_red_eye,
                title: "Password",
                controller: passwordController,
              ),
              SizedBox(height: 20),
              Obx(
                () => CustomButton(
                  active: signUpController.isLoading.value,
                  title: "SIGNUP",
                  borderCol: Colors.deepPurple,
                  textCol: Colors.white,
                  buttonCol: Colors.deepPurple,
                  onTap: () {
                    signUpController.signUp(
                      emailController.text,
                      passwordController.text,
                      nameController.text,
                    );
                  },
                ),
              ),
              SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Get.to(() => LoginPage());
                },
                child: Text("or Log instead"),
              ),

              SizedBox(height: size.height * 0.10),

              Text("Made with ❤️ by Aniket"),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:chat_app/Widgets/custom_textfield.dart';
import 'package:chat_app/controller/login_controller.dart';
import 'package:chat_app/pages/signup_page.dart';

import 'package:chat_app/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final size = MediaQuery.of(context).size;

    final LoginController loginController = Get.put(LoginController());

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
                  active: loginController.isloading.value,

                  title: "Login",
                  borderCol: Colors.deepPurple,
                  textCol: Colors.white,
                  buttonCol: Colors.deepPurple,
                  onTap: () {
                    loginController.login(
                      emailController.text,
                      passwordController.text,
                    );
                  },
                ),
              ),
              SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Get.to(() => SignUpPage());
                },
                child: Text("Don't have account try SignUp??"),
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

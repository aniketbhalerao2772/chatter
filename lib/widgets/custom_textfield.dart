import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.prefixIcons,
    this.suffixIcons,
    required this.title,
    required this.controller,
  });

  final IconData? prefixIcons;

  final IconData? suffixIcons;
  final TextEditingController controller;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcons),
          label: Text("$title"),
          suffixIcon: Icon(suffixIcons),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}

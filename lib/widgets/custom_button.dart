

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    required this.borderCol,
    required this.textCol,
    required this.buttonCol,
    required this.active,
  });

  final String title;
  final void Function()? onTap;
  final Color borderCol;
  final Color textCol;
  final Color buttonCol;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonCol,
            borderRadius: BorderRadius.circular(20),
            border: BoxBorder.all(color: borderCol),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),

            child: active == true
                ? CircularProgressIndicator()
                : Text("$title", style: TextStyle(color: textCol)),
          ),
        ),
      ),
    );
  }
}

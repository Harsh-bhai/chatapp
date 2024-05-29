import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade500 // Light mode color
                : Colors.grey.shade700, // Dark mode color
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.green // Light mode color
                : Colors.green.shade200, // Dark mode color
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade200 // Light mode color
            : Colors.grey.shade900, // Dark mode color
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade500 // Light mode color
              : Colors.grey.shade400, // Dark mode color
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool obscureText;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.placeholder,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: (obscureText),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade500),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green)),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: placeholder,
              hintStyle: TextStyle(color:Colors.grey.shade500)
              ),
              
    );
  }
}

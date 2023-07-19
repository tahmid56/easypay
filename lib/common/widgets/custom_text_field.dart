import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final int maxLines;

  const CustomTextField(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: "Enter $hintText",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.black,
              ))),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter your $hintText";
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}

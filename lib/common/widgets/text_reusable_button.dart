import 'package:flutter/material.dart';

class TextReusableButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const TextReusableButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        buttonText,
        style: const TextStyle(
            fontSize: 15,
            color: Color(0xffd2e063),
            fontWeight: FontWeight.bold,
            fontFamily: "Italian Plate 2",
            decoration: TextDecoration.underline),
      ),
    );
  }
}

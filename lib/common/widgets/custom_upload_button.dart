import 'package:flutter/material.dart';

class CustomUploadButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const CustomUploadButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(buttonText),
        ),
      ),
    );
  }
}

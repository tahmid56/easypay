import 'package:flutter/material.dart';

class CustomUploadButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color color;
  const CustomUploadButton(
      {super.key,
      required this.buttonText,
      this.color = Colors.white,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: Color(0xffcccccc)),
          ),
        ),
      ),
    );
  }
}

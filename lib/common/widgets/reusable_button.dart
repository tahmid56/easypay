import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final int colorCode;
  const ReusableButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.colorCode = 0xffD2E063});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(colorCode)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              buttonText,
              style: const TextStyle(fontFamily: 'Italian Plate 2'),
            ),
          ),
        ),
      ),
    );
  }
}

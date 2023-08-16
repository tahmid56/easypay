import 'package:easypay/constants/theme.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final int colorCode;
  final double customWidth;
  const ReusableButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      required this.customWidth,
      this.colorCode = 0xffD2E063});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: customWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(colorCode)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              buttonText,
              style: const TextStyle(
                  fontFamily: CustomTheme.fontFamily, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

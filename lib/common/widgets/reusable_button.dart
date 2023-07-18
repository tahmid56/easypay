import 'package:flutter/material.dart';


class ReusableButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const ReusableButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
              onTap: onPressed,
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:const Color(0xffD2E063)),
                child: Center(
                  child: Padding(
                    padding:const EdgeInsets.all(8.0),
                    child: Text(buttonText),
                  ),
                ),
              ),
            );
  }
}

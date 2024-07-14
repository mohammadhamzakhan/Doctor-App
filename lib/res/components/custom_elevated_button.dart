import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;

  const CustomElevatedButton(
      {super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        child: Text(buttonText),
      ),
    );
  }
}

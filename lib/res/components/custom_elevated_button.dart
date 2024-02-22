import 'package:flutter/material.dart';

import '../../consts/strings.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  CustomElevatedButton({super.key,required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(buttonText),
        style: ElevatedButton.styleFrom(

          backgroundColor: Colors.grey.shade400,
          foregroundColor: Colors.black,

        ),
      ),
    );
  }
}

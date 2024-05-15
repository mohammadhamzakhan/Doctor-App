import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final Color borderColor;
  final Color? textFieldColor;
  final Color enableColor;
  final TextEditingController? textController;
  final Color inputColor;
  final IconButton? iconButton;
  CustomTextField(
      {super.key,
      required this.hint,
      this.textController,
        this.iconButton,
      this.borderColor = Colors.black,
      this.enableColor = Colors.black,
      this.textFieldColor,
      this.inputColor = Colors.black

      });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color:widget.inputColor
      ),
      controller: widget.textController,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: widget.iconButton,
        hintStyle: TextStyle(color: widget.textFieldColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: widget.enableColor),
        ),
        hintText: widget.hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final Color borderColor;
  final Color? textFieldColor;
  final Color enableColor;
  final TextEditingController? textController;
  final Color inputColor;
  final IconButton? iconButton;
  final bool obscureText;
  final String? Function(String?)? validator; // Validator function

  CustomTextField({
    super.key,
    required this.hint,
    this.textController,
    this.iconButton,
    this.borderColor = Colors.black,
    this.enableColor = Colors.black,
    this.textFieldColor,
    this.inputColor = Colors.black,
    this.obscureText = false,
    this.validator, // Include validator in the constructor
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: widget.inputColor,
      ),
      controller: widget.textController,
      cursorColor: Colors.blue,
      obscureText: _isObscured,
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            _isObscured ? Icons.visibility_off : Icons.visibility,
            color: widget.inputColor,
          ),
          onPressed: _togglePasswordVisibility,
        )
            : widget.iconButton,
        hintStyle: TextStyle(color: widget.textFieldColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: widget.enableColor),
        ),
        hintText: widget.hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      validator: widget.validator, // Assign validator to the TextFormField
    );
  }
}

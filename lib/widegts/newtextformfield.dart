import 'package:flutter/material.dart';

class NewTextField extends StatelessWidget {
  const NewTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.validator,
    this.isPassword = false,
  }) : super(key: key);
  final String labelText;
  final bool isPassword;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}

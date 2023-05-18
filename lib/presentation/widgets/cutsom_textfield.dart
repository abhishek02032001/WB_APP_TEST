import 'package:flutter/material.dart';
import 'package:wmapp/constant/color.dart';
import 'package:wmapp/constant/size.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  final TextInputType textInputType;
  final String hint;

  const CustomTextField({
    super.key,
    required this.textController,
    required this.hint,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      width: getWidth(context) - 40,
      child: TextField(
        controller: textController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: black,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

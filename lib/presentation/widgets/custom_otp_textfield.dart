import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOTPTextField extends StatelessWidget {
  final TextEditingController textController;
  final double textBoxSize;
  final Function(String) onChanged;
  const CustomOTPTextField(
      {super.key, required this.textBoxSize, required this.onChanged, required this.textController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: min(50, textBoxSize),
      width: min(50, textBoxSize),
      child: TextField(
        controller: textController,
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        style: Theme.of(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}

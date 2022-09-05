import 'package:flutter/material.dart';

class DevotionEntryTextField extends StatelessWidget {
  final String hintText;
  final maxLines;
  final TextEditingController textForDETF;

  DevotionEntryTextField(
      {required this.hintText,
        required this.maxLines,
        required this.textForDETF});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: TextField(
        maxLines: maxLines,
        keyboardType: TextInputType.multiline,
        controller: textForDETF,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}

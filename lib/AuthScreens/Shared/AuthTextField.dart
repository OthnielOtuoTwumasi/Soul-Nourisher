import 'package:flutter/material.dart';
class AuthTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
 final  TextEditingController text;
  AuthTextField({required this.hintText, required this.icon, required this.obscureText,  required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      child: TextField(
        controller:  text,
          obscureText: obscureText,
          decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.black,
              ),
              hintText: hintText)),
    );
  }
}

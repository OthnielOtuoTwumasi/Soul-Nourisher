import 'package:flutter/material.dart';

class LandingPageButtonWidget extends StatelessWidget {
  final String text;
  final Function() onPressed;

  LandingPageButtonWidget({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(5))))),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ));
  }
}

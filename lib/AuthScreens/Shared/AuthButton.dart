import 'package:flutter/material.dart';
///will go at a point
import 'package:project2login/MainScreens/MainPageScreen.dart';
class AuthButton extends StatelessWidget {
  final String authType;
  final Function() onPressed;
  AuthButton({required this.authType, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 14),
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10))))),
          onPressed:onPressed,
          child: Text(
            authType,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

import 'package:flutter/material.dart';

void authAlertDialog(context, String message) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error!",
              style: TextStyle(fontSize: 25, color: Colors.teal)),
          content: Text(
            message,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w400, color: Colors.teal),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Okay", style: TextStyle(color: Colors.teal))),
          ],
        );
      });
}

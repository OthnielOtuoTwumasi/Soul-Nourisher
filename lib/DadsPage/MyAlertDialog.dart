import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project2login/AuthScreens/Shared/AuthAlertDialog.dart';
import 'package:project2login/Models/InfoModelForProvider.dart';
import 'package:provider/provider.dart';

void myAlertDialogs(
    context,
    String title,
    String quotation,
    String devotion,
    TextEditingController titleTextEditingController,
    TextEditingController quotationTextEditingController,
    TextEditingController devotionTextEditingController) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return MyAlertDialog(
          title: title,
          quotation: quotation,
          devotion: devotion,
          titleTextEditingController: titleTextEditingController,
          quotationTextEditingController: quotationTextEditingController,
          devotionTextEditingController: devotionTextEditingController,
        );
      });
}

class MyAlertDialog extends StatefulWidget {
  final String title;
  final String quotation;
  final String devotion;
  final TextEditingController titleTextEditingController;
  final TextEditingController quotationTextEditingController;
  final TextEditingController devotionTextEditingController;

  MyAlertDialog(
      {required this.title,
      required this.quotation,
      required this.devotion,
      required this.titleTextEditingController,
      required this.quotationTextEditingController,
      required this.devotionTextEditingController});

  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  bool _showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      child: AlertDialog(
        title: Text(
          "Submit Devotion?",
          style: TextStyle(
            color: Colors.teal,
          ),
        ),
        content: Text("Are you sure you want to submit?"),
        actions: [
          TextButton(
              onPressed: () async {
                if (widget.title.isEmpty ||
                    widget.quotation.isEmpty ||
                    widget.devotion.isEmpty) {
                  Navigator.pop(context);
                  return authAlertDialog(
                      context, "Please fill in the blank field(s)");
                } else {
                  try {
                    setState(() {
                      _showSpinner = true;
                    });
                    await Provider.of<InfoModelForProvider>(context,
                            listen: false)
                        .addToFireStore(widget.title, "log 3", widget.quotation,
                            widget.devotion);
                    widget.titleTextEditingController.clear();
                    widget.quotationTextEditingController.clear();
                    widget.devotionTextEditingController.clear();
                    Navigator.pop(context);
                  } catch (e) {
                    authAlertDialog(context, "Please try again");
                  }

                  setState(() {
                    _showSpinner = false;
                  });
                }

                // Provider.of<InfoModelForProvider>(context, listen: false)
                //     .addInformationToDevotional(
                //   ///image frm cloud fire store
                //         title, devotion, "log 3", quotation);
                // print(title);
              },
              child: Text("Yes", style: TextStyle(color: Colors.teal))),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No", style: TextStyle(color: Colors.teal))),
        ],
      ),
    );
  }
// meaning user can't tap outside the alert dialog to make it disappear

}

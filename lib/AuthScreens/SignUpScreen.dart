import 'package:flutter/material.dart';
import 'package:project2login/AuthScreens/Shared/AuthAlertDialog.dart';
import 'Shared/AuthTextField.dart';
import 'Shared/AuthButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project2login/Models/InfoModelForProvider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();
  bool _showSpinner = false;

  @override
  void dispose() {
    _emailText.dispose();
    _passwordText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      child: Consumer<InfoModelForProvider>(builder: (_, info, __) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[50],
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                )),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: Text(
                "Register Here",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              )),
              Center(
                child: Text(
                  "Welcome to the family! We are glad to have you",
                  style: TextStyle(
                      fontSize: 10, letterSpacing: 1, color: Colors.grey),
                ),
              ),
              AuthTextField(
                hintText: "Enter your email",
                icon: Icons.email_outlined,
                obscureText: false,
                text: _emailText,
              ),
              AuthTextField(
                hintText: "Enter your password",
                icon: Icons.password,
                obscureText: true,
                text: _passwordText,
              ),
              AuthButton(
                authType: "Sign Up",
                onPressed: () async {
                  setState(() {
                    _showSpinner = true;
                  });
                  try {
                    await info.signUp(_emailText.text, _passwordText.text);
                    if (_emailText.text.isNotEmpty) {
                      Navigator.pushNamed(context, "/MainPage");
                    } else if (_emailText.text == "revotuo@gmail.com" &&
                        _passwordText.text == "0243774800") {
                      Navigator.pushNamed(context, "/DadsPage");
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      authAlertDialog(context, "password is weak");
                    } else if (e.code == 'email-already-in-use') {
                      authAlertDialog(context, "Email is taken");
                    }else {
                      authAlertDialog(context, "Please try again");
                    }
                  }
                  setState(() {
                    _showSpinner = false;
                  });
                },
              )
            ],
          ),
        );
      }),
    );
  }
}

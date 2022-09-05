import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Shared/AuthTextField.dart';
import 'Shared/AuthButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Shared/AuthAlertDialog.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project2login/Models/InfoModelForProvider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();
  bool _showSpinner = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailText.dispose();
    _passwordText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      color: Colors.black,
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
                "Login Here",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              )),
              Center(
                child: Text(
                  "Welcome back! We're happy to see you again",
                  style: TextStyle(
                      fontSize: 10, letterSpacing: 1, color: Colors.grey),
                ),
              ),

              /// will take text editing controller at a point
              /// and also firebase auth for this and signup screen
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
                authType: "Sign In",
                onPressed: () async {
                  setState(() {
                    _showSpinner = true;
                  });
                  try {
                    await info.signIn(_emailText.text, _passwordText.text);
                    if (_emailText.text == "revotuo@gmail.com" &&
                        _passwordText.text == "0243774800") {
                      Navigator.pushNamed(context, "/DadsPage");
                    } else if (_emailText.text.isNotEmpty &&
                        _passwordText.text.isNotEmpty) {
                      Navigator.pushNamed(context, "/MainPage");
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      authAlertDialog(context, "User not found");
                    } else if (e.code == 'wrong-password') {
                      authAlertDialog(context, "The password is incorrect");
                      print("The password is incorrect");
                    } else {
                      authAlertDialog(context, "Please try again");
                      print(e);
                    }
                  }
                  setState(() {
                    _showSpinner = false;
                  });
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

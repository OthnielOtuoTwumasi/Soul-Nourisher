import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project2login/AuthScreens/SignInScreen.dart';
import 'package:project2login/AuthScreens/SignUpScreen.dart';
import 'package:project2login/DadsPage/Screen/DadsPage.dart';
import 'package:project2login/MainScreens/MainPageScreen.dart';
import 'package:project2login/MainScreens/ViewPageScreen.dart';
import 'package:project2login/scratch.dart';
import 'AuthScreens/LandingPageScreen.dart';
import 'package:project2login/MyThemeData.dart';
import 'package:provider/provider.dart';
import 'Models/InfoModelForProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(DailyDevReboot());
}

class DailyDevReboot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InfoModelForProvider(),
      child: MaterialApp(
        routes: {
          "/MainPage": (context) => MainPage(),
          "/DadsPage": (context) => DadsPage(),
          "/SignIn": (context) => SignInPage(),
          "/SignUp": (context) => SignUpPage(),
          "/ViewPage": (context) => ViewPage(),
          "/Landing": (context) => LandingPage(),
        },
        home: Scratch(),
        theme: myThemeData(),
      ),
    );
  }
}

Widget screenToShow() {
  if (FirebaseAuth.instance.currentUser != null &&
      FirebaseAuth.instance.currentUser!.email != "revotuo@gmail.com") {
    print(FirebaseAuth.instance.currentUser!.email.toString());
    return MainPage();
  } else if (FirebaseAuth.instance.currentUser != null &&
      FirebaseAuth.instance.currentUser!.email == "revotuo@gmail.com") {
    return DadsPage();
  } else {
    return LandingPage();
  }
}


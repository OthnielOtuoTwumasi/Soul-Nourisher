import 'package:flutter/material.dart';

import 'LandingPageButton.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/log 3.jpg"), fit: BoxFit.cover)),
          ),
          Positioned(
              top: 50,
              // left: 132,
              //  right: 132,
              child: Text(
                "DAILY",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              )),
          Positioned(
              top: 80,
              // left: 50,
              // right: 50,
              child: Text(
                "DEVOTION",
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 3),
                child: LandingPageButtonWidget(
                  text: "Sign In",
                  onPressed: () {
                    Navigator.pushNamed(context, "/SignIn");
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 3),
                child: LandingPageButtonWidget(
                  text: "Sign Up",
                  onPressed: () {
                    Navigator.pushNamed(context, "/SignUp");
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

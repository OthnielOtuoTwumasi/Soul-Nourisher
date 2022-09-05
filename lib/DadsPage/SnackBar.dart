import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

// Help with type
void connectivitySnackBar(
    BuildContext context, InternetConnectionStatus dataConnectivityStatus) {
  late String text;
  Color snackBarColor = Colors.blue;

  if (dataConnectivityStatus == InternetConnectionStatus.connected) {
    text = "You're connected to mobile internet";
    print(text);
  } else if (dataConnectivityStatus == InternetConnectionStatus.connected) {
    snackBarColor = Colors.blue;
    text = "You're on wifi";
    print(text);
  } else {
    snackBarColor = Colors.red;
    text = "You may be connected to a network but there's no data.";
  }
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: snackBarColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
// ConnectivityResult dataConnectivityType,
// dataConnectivityType == ConnectivityResult.mobile &&
// dataConnectivityType == ConnectivityResult.wifi &&

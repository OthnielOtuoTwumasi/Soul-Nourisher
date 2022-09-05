import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project2login/DadsPage/SnackBar.dart';
import 'package:project2login/Models/InfoModelForProvider.dart';
import 'package:provider/provider.dart';
import '../ModalSheetCustomization.dart';
import '../DevotionEntryTextField.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../MyAlertDialog.dart';

enum Settings { Archive, Logout }

class DadsPage extends StatefulWidget {
  @override
  _DadsPageState createState() => _DadsPageState();
}

class _DadsPageState extends State<DadsPage> {
  TextEditingController _typeTitleText = TextEditingController();
  TextEditingController _typeQuotationText = TextEditingController();
  TextEditingController _typeDevotionText = TextEditingController();
  late InternetConnectionStatus internetConnectivityUpdate;
  Color submitButtonColor = Colors.teal;

  @override
  @override
  void dispose() {
    _typeDevotionText.dispose();
    _typeQuotationText.dispose();
    _typeTitleText.dispose();
    internetCheckerSubscription.cancel();
    super.dispose();
  }

  // Connectivity _connectivity = Connectivity();
  late StreamSubscription<InternetConnectionStatus> internetCheckerSubscription;

  @override
  void initState() {
    //ask questions
    //ConnectivityResult update = ConnectivityResult.none;

    internetCheckerSubscription =
        InternetConnectionChecker().onStatusChange.listen((dataStatus) {
      setState(() {
        internetConnectivityUpdate = dataStatus;
        internetConnectivityUpdate == InternetConnectionStatus.connected
            ? submitButtonColor = Colors.teal
            : submitButtonColor = Colors.grey;
      });
      connectivitySnackBar(context, internetConnectivityUpdate);
    });
    // connectivitySubscription = _connectivity.onConnectivityChanged.listen(
    //   (dataConnectionTypeStatus) {
    //     setState(() {
    //       update = dataConnectionTypeStatus;
    //     });
    //
    //     print("this is event${dataConnectionTypeStatus.toString()}");
    //   },
    // );

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoModelForProvider>(builder: (_, info, __) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton<Settings>(
                onSelected: (Settings result) async {
                  if (result == Settings.Logout) {
                    await info.signOut(context);
                  } else {
                    print("Archive room");
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem<Settings>(
                        child: Text("Logout"),
                        value: Settings.Logout,
                      ),
                      PopupMenuItem<Settings>(
                        child: Text("Archive"),
                        value: Settings.Archive,
                      ),
                    ])
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            modalSheetMethod(
              context,
              _typeTitleText.text,
              _typeQuotationText.text,
              _typeDevotionText.text,

              ///image
              "log 3",
            );
          },
          child: Text(
            "Preview",
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              DevotionEntryTextField(
                hintText: "Type title here",
                maxLines: 1,
                textForDETF: _typeTitleText,
              ),
              DevotionEntryTextField(
                  hintText: "Type quotation here",
                  maxLines: 1,
                  textForDETF: _typeQuotationText),
              Expanded(
                child: DevotionEntryTextField(
                    hintText: "Type devotion here",
                    maxLines: null,
                    textForDETF: _typeDevotionText),
              ),
              Center(
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(submitButtonColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),

                    // ask if he is sure he wants to submit before submitting
                    onPressed: () {
                      if (internetConnectivityUpdate ==
                          InternetConnectionStatus.connected) {
                        return myAlertDialogs(
                            context,
                            _typeTitleText.text,
                            _typeQuotationText.text,
                            _typeDevotionText.text,
                            _typeTitleText,
                            _typeQuotationText,
                            _typeDevotionText);
                      } else {
                        return null;
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}

//
// IconButton(
// onPressed: () async {
// await info.signOut(context);
// },
// icon: Icon(Icons.logout),
// color: Colors.white,
// )

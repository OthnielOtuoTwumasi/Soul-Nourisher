import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project2login/AuthScreens/LandingPageScreen.dart';
import 'package:project2login/AuthScreens/Shared/AuthAlertDialog.dart';
import 'package:project2login/DadsPage/Screen/DadsPage.dart';
import 'package:project2login/MainScreens/MainPageScreen.dart';
import 'InfoModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InfoModelForProvider extends ChangeNotifier {
  String _newTitle = "TestTitle";
  String _newDevotion = "TestDevotion";
  String _newImage = "TestIMage";
  String _newQuotation = "TestQuotation";
  bool clearTextField = false;
  final Connectivity _connectivity = Connectivity();


  List<InfoModel> _infoModelList = [
    InfoModel(
        title: "God is good. Say amen!",
        devotion:
            "God loves us. He gave his life and wants us to be saved. He is good and we must all agree masa!!!!!",
        image: "log 3",
        quotation: "John 10:30"),
    InfoModel(
        title: "Peace is the key",
        devotion:
            "In the end all we truly value is peace of mind. We need peace. We ned peace. NO amount of money can buy that",
        image: "log 3",
        quotation: "John 10:30"),
    InfoModel(
        title: "Original",
        devotion:
            "This is the original image im showing. It is the one for the landing page so you must learn to accept it",
        image: "log 3",
        quotation: "John 10:30"),
    InfoModel(
        title: "Study to show yourself approved",
        devotion:
            "The bible says we should study to show ourselves approved andi couldn't agree more. Man learn",
        image: "log 3",
        quotation: "John 10:30"),
    InfoModel(
        title: "Return!!!",
        devotion:
            "Just like the prodigal son, dont be afraid to go back when you realize you have made a mistake. it shall be well with you",
        image: "log 3",
        quotation: "John 10:30"),
    InfoModel(
        title: "Original",
        devotion:
            "This is the original image im showing. It is the one for the landing page so you must learn to accept it",
        image: "log 3",
        quotation: "John 10:30"),
    InfoModel(
        title: "God is good. Say amen!",
        devotion:
            "God loves us. He gave his life and wants us to be saved. He is good and we must all agree masa!!!!!",
        image: "log 3",
        quotation: "John 10:30"),
    InfoModel(
        title: "Peace is the key",
        devotion:
            "In the end all we truly value is peace of mind. We need peace. We ned peace. NO amount of money can buy that",
        image: "log 3",
        quotation: "John 10:30"),
  ];

  UnmodifiableListView<InfoModel> get parameterList {
    return UnmodifiableListView(_infoModelList);
  }

  // show devotional i click on
  void updateInformation(
      String title, String devotion, String image, String quotation) {
    _newTitle = title;
    _newDevotion = devotion;
    _newImage = image;
    _newQuotation = quotation;
    notifyListeners();
  }

  //add a new set of info to the list
  void addInformationToDevotional(
      String title, String devotion, String image, String quotation) {
    final addInfo = InfoModel(
        title: title, devotion: devotion, image: image, quotation: quotation);
    _infoModelList.add(addInfo);
    notifyListeners();
  }

  // delete devotional on dad's side
  void deleteInformation(
      String title, String devotion, String image, String quotation) {
    final deleteInfo = InfoModel(
        title: title, devotion: devotion, image: image, quotation: quotation);
    _infoModelList.remove(deleteInfo);
    notifyListeners();
  }

  String newTitle() => _newTitle;

  String newQuotation() => _newQuotation;

  String newDevotion() => _newDevotion;

  String newImage() => _newImage;

  Future signIn(String email, String password) async  {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future signUp(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future addToFireStore(
    String title,
    String image,
    String devotion,
    String quotation,
  ) async {
    await FirebaseFirestore.instance.collection('infoAdded').add({
      'title': title,
      'devotion': devotion,
      'image': image,
      'quotation': quotation,
    });
    notifyListeners();
  }

Future signOut (context) async{
    await FirebaseAuth.instance.signOut();
    if (FirebaseAuth.instance.currentUser == null){
      Navigator.pushNamed(context, "/Landing");
      notifyListeners();
    }
}

  Future<QuerySnapshot> getFromDatabase({required String collection}) async =>
      await FirebaseFirestore.instance.collection(collection).get();

}


import 'package:flutter/material.dart';
import 'package:project2login/Models/InfoModelForProvider.dart';
import 'package:provider/provider.dart';

class ViewPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<InfoModelForProvider>(
        builder: (_,info,__){
          return  ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_rounded)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    // work on image
                    child: Image.asset("images/${info.newImage()}.jpg")),
              ),
              Center(
                child: Text(
                  info.newTitle(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                  child: Text(
                  info.newQuotation(),
                    style: TextStyle(fontSize: 15),
                  )),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  info.newDevotion(),
                  style: TextStyle(fontSize: 16),
                ),
              ),

            ],
          );
        },

      ),
    );
  }
}

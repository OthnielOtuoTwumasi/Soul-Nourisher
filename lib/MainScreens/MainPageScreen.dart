import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2login/MainScreens/DataContainer.dart';
import 'package:project2login/Models/InfoModelForProvider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {




  @override
  Widget build(BuildContext context) {
    return Consumer<InfoModelForProvider>(builder: (_, info, __) {
      return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () async {
                    await info.signOut(context);
                  },
                  icon: Icon(Icons.logout),
                  color: Colors.white,
                )
              ],
              centerTitle: true,
              title: Text("Devotions"),
              expandedHeight: 200,
              backgroundColor: Colors.teal,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "images/log 3.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return DataContainer(
                    devotion: info.parameterList[index].devotion,
                    title: info.parameterList[index].title,
                    image: info.parameterList[index].image,
                    onTap: () {
                      info.updateInformation(
                        info.parameterList[index].title,
                        info.parameterList[index].devotion,
                        info.parameterList[index].image,
                        info.parameterList[index].quotation,
                      );
                      Navigator.pushNamed(context, "/ViewPage");
                    },
                  );
                },
                childCount: info.parameterList.length,
              ),
            )
          ],
        ),
      );
    });
  }
}

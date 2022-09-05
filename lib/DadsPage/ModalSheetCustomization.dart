import 'package:flutter/material.dart';

Future<void> modalSheetMethod(
  context,
  String title,
  String quotation,
  String devotion,
  String image,
) {
  return showModalBottomSheet(
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (BuildContext context) {
        return ModalSheetCustomization(
          title: title,
          quotation: quotation,
          devotion: devotion,
          image: image,
        );
      });
}

class ModalSheetCustomization extends StatefulWidget {
  final String image;
  final String title;
  final String quotation;
  final String devotion;

  ModalSheetCustomization(
      {required this.devotion,
      required this.title,
      required this.quotation,
      required this.image});

  @override
  _ModalSheetCustomizationState createState() => _ModalSheetCustomizationState();
}

class _ModalSheetCustomizationState extends State<ModalSheetCustomization> {
  @override
  Widget build(BuildContext context) {
    return  ListView(

      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 22, 30, 0),
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
              child: Image.asset("images/${widget.image}.jpg")),
        ),
        Center(
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
            child: Text(
          widget.quotation,
          style: TextStyle(fontSize: 15),
        )),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            widget.devotion,
            style: TextStyle(fontSize: 16),
          ),
        ),

      ],
    );
  }
}

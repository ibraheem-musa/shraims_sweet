import 'package:first_app_for_test/Colors.dart';
import 'package:flutter/material.dart';

class NotifaiDetailse extends StatefulWidget {
  const NotifaiDetailse({key}) : super(key: key);

  @override
  _NotifaiDetailseState createState() => _NotifaiDetailseState();
}

class _NotifaiDetailseState extends State<NotifaiDetailse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorForDesign().black,
      appBar: AppBar(
        title: Text(
          "Notifecation From " + "Name",
          style: TextStyle(color: ColorForDesign().Gold),
        ),
        centerTitle: true,
        backgroundColor: ColorForDesign().black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(80), topLeft: Radius.circular(80)),
              border: Border.all(color: ColorForDesign().Gold, width: 1),
              color: ColorForDesign().black,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Name",
                      style: TextStyle(
                          fontSize: 25, color: ColorForDesign().Gold)),
                ),
                Wrap(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
                    child: Text(
                      "This text is very very vry very very very very very very very very veryry very very very very very very very very veryery very very very very very very very very ververy very very very very very very very very very very very very very very very very very very very very very very very very very long",
                      style:
                          TextStyle(fontSize: 20, color: ColorForDesign().Gold),
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

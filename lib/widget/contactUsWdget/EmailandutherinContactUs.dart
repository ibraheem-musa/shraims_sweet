import 'package:first_app_for_test/Colors.dart';
import 'package:flutter/material.dart';

class Emailandmap extends StatefulWidget {
  const Emailandmap({ key }) : super(key: key);

  @override
  _EmailandmapState createState() => _EmailandmapState();
}

class _EmailandmapState extends State<Emailandmap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:  ColorForDesign().black,
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("phone: ",style: TextStyle(fontSize: 20,color:  ColorForDesign().Gold),),
          Text("+1226-663-2886",style: TextStyle(fontSize: 18,color:  ColorForDesign().Gold),),
          Text("Email: ",style: TextStyle(fontSize: 20,color:  ColorForDesign().Gold),),
          Text("sherimm1997@gamil.com",style: TextStyle(fontSize: 18,color:  ColorForDesign().Gold),) 
        ],),
      ),
    );
  }
}
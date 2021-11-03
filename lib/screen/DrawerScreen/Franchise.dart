import 'package:first_app_for_test/applocal.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class Franchise extends StatefulWidget {
  const Franchise({  key }) : super(key: key);

  @override
  _FranchiseState createState() => _FranchiseState();
}

class _FranchiseState extends State<Franchise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context).translate('franchise')),
            backgroundColor: HexColor("#bf942e")),
        body: Container(),
      
        );
  }
}
import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/applocal.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PrivacyAndPolicy extends StatefulWidget {
  const PrivacyAndPolicy({key}) : super(key: key);

  @override
  State<PrivacyAndPolicy> createState() => _PrivacyAndPolicyState();
}

class _PrivacyAndPolicyState extends State<PrivacyAndPolicy> {
  double _width = 200;
  double _height = 0;
  Color _color= ColorForDesign().Gold;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((value) => setState(() {
          _width = MediaQuery.of(context).size.width;
          _height = MediaQuery.of(context).size.height;
          _color= ColorForDesign().black;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
            centerTitle: true,
            backgroundColor:
            Colors.black
            ),
        body: Center(
          child: AnimatedContainer(
              color: _color,
              curve: Curves.easeInExpo,
              width: _width,
              height: _height,
              duration: Duration(milliseconds: 1000),
              child: Center(
                child: SingleChildScrollView(
                  child: Wrap(
                    children: [
                      Center(
                        child: Text(
                          
                            AppLocalizations.of(context)
                                .translate('PrivacyandPolicy'),
                            style: TextStyle(fontSize: 30,color:  ColorForDesign().Gold),textAlign: TextAlign.center,),
                      ),
                      TextForprivacyANDPolicr(
                        text: AppLocalizations.of(context)
                                .translate('PrivacyPolicy1')
                            ,
                      ),
                      TextForprivacyANDPolicr(
                        text:AppLocalizations.of(context)
                                .translate('PrivacyPolicy2')
                           ,
                      ),
                      TextForprivacyANDPolicr(
                        text:AppLocalizations.of(context)
                                .translate('PrivacyPolicy3')
                            ,
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class TextForprivacyANDPolicr extends StatelessWidget {
  String text;
  TextForprivacyANDPolicr({this.text});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color:  ColorForDesign().Gold))),
        ),
      ],
    );
  }
}

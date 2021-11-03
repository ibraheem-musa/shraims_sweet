import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/applocal.dart';
import 'package:flutter/animation.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({  key }) : super(key: key);

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  final controler=ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000)).then((value) => setState(() {
         scroldown();
        }));
  }
    scroldown()
    {
final double end=controler.position.maxScrollExtent;
      controler.animateTo(end, duration: Duration(seconds: 45), curve:Curves.linear);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context).translate('TermsandCondition')),
            centerTitle: true,
            backgroundColor:  ColorForDesign().black),
        body: Center(
        child: Container(
          color: ColorForDesign().black ,
          child: ListView(
          controller: controler,
          children: [
              Wrap(children: [
                TextForTermAndCondition(text: AppLocalizations.of(context).translate('TermAndConditionpart1',),fontsize: 22,),
TextForTermAndCondition(text: AppLocalizations.of(context).translate('TermAndConditionpart2',),fontsize: 18,),
TextForTermAndCondition(text: AppLocalizations.of(context).translate('TermAndConditionpart3',),fontsize: 18,),
TextForTermAndCondition(text: AppLocalizations.of(context).translate('TermAndConditionpart4',),fontsize: 18,),
TextForTermAndCondition(text: AppLocalizations.of(context).translate('TermAndConditionpart5',),fontsize: 18,),
TextForTermAndCondition(text: AppLocalizations.of(context).translate('TermAndConditionpart6',),fontsize: 18,),
TextForTermAndCondition(text: AppLocalizations.of(context).translate('TermAndConditionpart7',),fontsize: 18,),
TextForTermAndCondition(text: AppLocalizations.of(context).translate('TermAndConditionpart8',),fontsize: 18,),
TextForTermAndCondition(text: AppLocalizations.of(context).translate('TermAndConditionpart9',),fontsize: 18,),



               ],)

          ],
        ),),
        
      ),
   
       
        );
  }
}

class TextForTermAndCondition extends StatelessWidget {
  String text;
  double fontsize;
  TextForTermAndCondition({this.text,this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15,left: 8,right: 8),
          child: Center(
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: fontsize, color:  ColorForDesign().Gold))),
        ),
      ],
    );
  }
}

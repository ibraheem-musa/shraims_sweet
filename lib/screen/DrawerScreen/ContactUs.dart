import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/applocal.dart';
import 'package:first_app_for_test/widget/contactUsWdget/EmailandutherinContactUs.dart';
import 'package:first_app_for_test/widget/contactUsWdget/MessageinContactUs.dart';
import 'package:first_app_for_test/widget/contactUsWdget/SocialMediaContactUs.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
        appBar: AppBar(
            title: Text(AppLocalizations.of(context).translate('ContactUs')),
            backgroundColor: HexColor("#bf942e")),
        body: Container(
          color:  ColorForDesign().black,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(children: [
          
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 8),
                  child: MessageandNot(),
                ),
                Divider(thickness: 2,color: ColorForDesign().Gold,indent: 15,endIndent: 15,),
                SocialMedia(),
                Divider(thickness: 2,color:  ColorForDesign().Gold,indent: 15,endIndent: 15,),
                Emailandmap(),
          
              ],),
          ),
            
          
        ));
  }
}

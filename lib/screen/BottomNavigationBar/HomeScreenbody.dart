import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/applocal.dart';
import 'package:first_app_for_test/screen/LoginScreen.dart';
import 'package:first_app_for_test/widget/Hombodywidget/ComingSoonwidget.dart';
import 'package:first_app_for_test/widget/Hombodywidget/Galary.dart';
import 'package:first_app_for_test/widget/Hombodywidget/HappyCustomers.dart';
import 'package:first_app_for_test/widget/Hombodywidget/Menuwidget.dart';
import 'package:first_app_for_test/widget/Hombodywidget/PadingTextForHomScreen.dart';
import 'package:first_app_for_test/widget/Hombodywidget/SpecialtodayWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenBody extends StatefulWidget {
  HomeScreenBody({Key});

  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorForDesign().black,
      height: double.maxFinite,
      child: ListView(
        children: <Widget>[
          //---------1 Spicial Today--------------
          TextForTitle(
            image: 'lib/assets/Socialmediaandicon/icon 5-05.png',
            text: AppLocalizations.of(context).translate('SpecialToday'),
          ),

          Specialtoday(),
          //-------------2 Menu-----------------------------------------
          // TextForTitle(
          //   image: 'lib/assets/Socialmediaandicon/icon 5-03.png',
          //   text: AppLocalizations.of(context).translate('Menu'),
          // ),

          // MenuWidget(),
          //---------------------------Coming Soon-------------------------------------
          TextForTitle(
            image: 'lib/assets/Socialmediaandicon/icon 5-04.png',
            text: AppLocalizations.of(context).translate('Coming Soon'),
          ),

          ComingSoon(),

          //----------------Gallery---------------------------------
          // TextForTitle(
          //   image: 'lib/assets/Socialmediaandicon/icon 5-01.png',
          //   text: AppLocalizations.of(context).translate('Gallery'),
          // ),

          // Galary(),
          //------------------Happy Customers-------------------------------
          TextForTitle(
            image: 'lib/assets/Socialmediaandicon/icon 5-02.png',
            text: AppLocalizations.of(context).translate('HappyCustomers'),
          ),

          HappyCustomers(),
        ],
      ),
    );
  }
}

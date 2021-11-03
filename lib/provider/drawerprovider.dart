import 'package:first_app_for_test/model/drawer_components.dart';
import 'package:flutter/cupertino.dart';

import '../model/drawer_components.dart';

class DrawerProvider with ChangeNotifier{
List<DrwerComponents> drawerscreentitle=[

  DrwerComponents(screenDrawertitleEn:'gallery',id: '2'),
  DrwerComponents(screenDrawertitleEn:'ordersHistory',id: '5'),
  DrwerComponents(screenDrawertitleEn:'ContactUs',id: '0'),
  // DrwerComponents(screenDrawertitleEn:'franchise',id: '6'),
  DrwerComponents(screenDrawertitleEn:'PrivacyandPolicy',id: '1'),
  DrwerComponents(screenDrawertitleEn:'TermsandCondition',id: '3'),
  DrwerComponents(screenDrawertitleEn:'languageChange',id: '4'),
  DrwerComponents(screenDrawertitleEn:'LogOut',id: '7'),
   

];

}
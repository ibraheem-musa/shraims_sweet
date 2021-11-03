import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:first_app_for_test/screen/BottomNavigationBar/CartScreen.dart';
import 'package:first_app_for_test/screen/BottomNavigationBar/HomeScreenbody.dart';
import 'package:first_app_for_test/screen/BottomNavigationBar/Notifications.dart';
import 'package:first_app_for_test/screen/BottomNavigationBar/OrdarScreen.dart';
import 'package:first_app_for_test/screen/BottomNavigationBar/SettingsScreen.dart';
import 'package:first_app_for_test/screen/home_screen.dart';
import 'package:flutter/material.dart';
class NavigationBar extends StatefulWidget {
  const NavigationBar({  key }) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}
int curentIndex=0;
class _NavigationBarState extends State<NavigationBar> {
  
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
    backgroundColor: Color(0xffbf942e),
    color: Color(0xff222222),
    items: <Widget>[
    
      Icon( Icons.home,color: Color(0xffbf942e) ,size: 30), 
      Icon( Icons.shopping_cart_sharp,color: Color(0xffbf942e),size: 30),
      Icon( Icons.account_balance_wallet_outlined,color: Color(0xffbf942e),size: 30),
      Icon( Icons.notifications,color: Color(0xffbf942e),size: 30),
      Icon( Icons.settings,color: Color(0xffbf942e),size: 30 )
      
    ],
   animationDuration: Duration(milliseconds: 250),
   animationCurve: Curves.linearToEaseOut,
        height: 50,
    onTap: (index) {
      setState(() {
        curentIndex=index;
      });
      // getWidgettodisplayOnbody(index);
    },
  );
  }
  getWidgettodisplayOnbody(int i){
     final tabe =[
        HomeScreenBody(),
        CartScreen(),
        OrdarScreen(),
        NotifficationScreen(),
        SettingScreen(),
     ];
return tabe[i];
  }
}

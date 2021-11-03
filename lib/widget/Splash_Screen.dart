import 'package:first_app_for_test/screen/LoginScreen.dart';
import 'package:first_app_for_test/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  const Splash({key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
  
}

class _SplashState extends State<Splash>  {
 
//  String finaluserEmail;
  // @override
  //    void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   saveAndChikshared();

  // }

  // saveAndChikshared() async {

  //     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //       setState(() {
  //         finaluserEmail=sharedPreferences.getString('userEmail');
  //           print(finaluserEmail+"this is from siplash screen");
  //       });
           
         
  // }


  @override
  Widget build(BuildContext context) {
    return  SplashScreen(
      seconds: 4,
      navigateAfterSeconds:  HomeScreen(),
      title: Text("Shraim's Sweets",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Color(0xffbf942e)
      ),),
      image:  Image.asset('lib/assets/Shraims_Logo.jpg',height:MediaQuery.of(context).size.height/4),
      backgroundColor: Colors.black,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      loaderColor: Color(0xffbf942e)
    );
  }
}

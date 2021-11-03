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

//   bool islogin=false;
//  //islogindone = ModalRoute.of(context).settings.arguments as bool;
// String finaluserEmail;
//   @override
//      void initState() {
//     // TODO: implement initState
//     super.initState();
//     saveAndChikshared();

//   }

//   saveAndChikshared() async {
//       SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//         setState(() {
//           finaluserEmail=sharedPreferences.getString('userEmail');
//         });
//           if (finaluserEmail!=null ||isLogingWithoutsherdpre!=null){
// setState(() {
//    islogin=true;
//    });
//    print(islogin.toString() +"from hom screen body");
// } else{
//  setState(() {
//     islogin =false;
//     print(islogin.toString() +"from hom screen body");
//  });
// }

//   }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorForDesign().black,
      height: double.maxFinite,
      child: ListView(
        children: <Widget>[
          // islogin
          //     ? SizedBox(height: 0,)
          //     : Padding(
          //       padding: const EdgeInsets.fromLTRB(5, 8, 5, 2),
          //       child: Container(
          //         height: MediaQuery.of(context).size.height / 5,
          //           decoration: BoxDecoration(
          //             border: Border.all(color: ColorForDesign().Gold),
          //             borderRadius: BorderRadius.all(Radius.circular(20)),
          //           ),

          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Center(
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [

          //                     Expanded(
          //                       child: Wrap(
          //                         children: [
          //                           Padding(
          //                             padding: const EdgeInsets.all(12.0),
          //                             child: Text(
          //                                 " Log in or create account to be one of our happy customers and to get all our Promotion ",
          //                                 textAlign: TextAlign.center,
          //                                 style: TextStyle(

          //                                     fontSize: 20, color: Color(0xffbf942e))),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Expanded(
          //                 child: Padding(
          //                   padding: const EdgeInsets.only(bottom: 6, top: 8),
          //                   child: OutlinedButton(
          //                       style: OutlinedButton.styleFrom(),
          //                       onPressed: () {
          //                          Navigator.pushReplacement(
          // context,
          // MaterialPageRoute(builder: (context) => LoginScreen()));
          //                       },
          //                       child: Text("Login",
          //                           style: TextStyle(color: Color(0xffbf942e)))),
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //     ),

          //---------1 Spicial Today--------------
          TextForTitle(
            image: 'lib/assets/Socialmediaandicon/icon 5-05.png',
            text: AppLocalizations.of(context).translate('SpecialToday'),
          ),

          Specialtoday(),
          //-------------2 Menu-----------------------------------------
          TextForTitle(
            image: 'lib/assets/Socialmediaandicon/icon 5-03.png',
            text: AppLocalizations.of(context).translate('Menu'),
          ),

          MenuWidget(),
          //---------------------------Coming Soon-------------------------------------
          TextForTitle(
            image: 'lib/assets/Socialmediaandicon/icon 5-04.png',
            text: AppLocalizations.of(context).translate('Coming Soon'),
          ),

          ComingSoon(),

          //----------------Gallery---------------------------------
          TextForTitle(
            image: 'lib/assets/Socialmediaandicon/icon 5-01.png',
            text: AppLocalizations.of(context).translate('Gallery'),
          ),

          Galary(),
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

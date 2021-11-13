import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/applocal.dart';
import 'package:first_app_for_test/main.dart';
import 'package:first_app_for_test/screen/BottomNavigationBar/SettingsScreen.dart';
import 'package:first_app_for_test/screen/DrawerScreen/ContactUs.dart';
import 'package:first_app_for_test/screen/DrawerScreen/Franchise.dart';
import 'package:first_app_for_test/screen/DrawerScreen/Galary.dart';
import 'package:first_app_for_test/screen/DrawerScreen/PrivacyandPolicy.dart';
import 'package:first_app_for_test/screen/DrawerScreen/TermsAndConditions.dart';
import 'package:first_app_for_test/screen/DrawerScreen/ordersHistory.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String lang;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveAndChikshared();

    getPref();
  }

  bool loginORlogout = false;
  //islogindone = ModalRoute.of(context).settings.arguments as bool;
  String finaluserEmail;

  saveAndChikshared() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      finaluserEmail = sharedPreferences.getString('userEmail');
    });
    if (finaluserEmail != null) {
      setState(() {
        loginORlogout = true;
      });
      print(loginORlogout.toString() + "from hom screen body");
    } else {
      setState(() {
        loginORlogout = false;
        print(loginORlogout.toString() + "from hom screen body");
      });
    }
  }

  Future getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      lang = sharedPreferences.getString("lang");
      sharedPreferences.commit();
    });
  }

  @override
  Widget build(BuildContext context) {
    // DrawerProvider drawerProvider =
    //     Provider.of<DrawerProvider>(context, listen: false);

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: ColorForDesign()
            .Gold, //This will change the drawer background to blue.
        //other styles
      ),
      child: Drawer(
        //  backgroundColo: Color(0xffbf942e),
        child: ListView(
          shrinkWrap: true,
          children: [
            !loginORlogout
                ? Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            primary: ColorForDesign().Gold,
                            side: BorderSide(width: 2.0, color: Colors.black),
                            // backgroundColor: ColorForDesign().Gold,
                            fixedSize: Size(200, 35)),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, nameroute.nameRouote_Loginscreen);
                        },
                        child: Text('Log in',
                            style: TextStyle(
                                fontSize: 20, color: ColorForDesign().black)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SettingScreen()));
                            },
                            icon: Icon(Icons.settings)),
                      )
                    ],
                  )
                : Container(
                    color: Colors.black38,
                    height: MediaQuery.of(context).size.height / 4,
                    child: Column(
                      children: [
                        Expanded(
                          // height: MediaQuery.of(context).size.height / 6,

                          child: Stack(
                            children: [
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1000.0),
                                    child: Image.asset(
                                        'lib/assets/Shraims_Logo.jpg'),
                                  ),
                                ),
                              ),
                              //   ],
                              // ),
                              Positioned(
                                right: 5,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SettingScreen()));
                                    },
                                    icon: Icon(Icons.settings)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Ibraheem",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            finaluserEmail,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
            ListtileRForListdrwer(
              iconForListTile: Icons.image,
              opject: Galary(),
              text: "gallery",
            ),
            ListtileRForListdrwer(
              iconForListTile: Icons.checklist_rounded,
              opject: OrdersHistory(),
              text: "ordersHistory",
            ),
            ListtileRForListdrwer(
              iconForListTile: Icons.message_rounded,
              opject: ContactUs(),
              text: "ContactUs",
            ),
            // ListtileRForListdrwer(
            //   opject: Franchise(),
            //   text: "franchise",
            // ),
            ListtileRForListdrwer(
              iconForListTile: Icons.privacy_tip,
              opject: PrivacyAndPolicy(),
              text: "PrivacyandPolicy",
            ),
            ListtileRForListdrwer(
              iconForListTile: Icons.assignment_outlined,
              opject: TermsAndConditions(),
              text: "TermsandCondition",
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.language,
                    color: ColorForDesign().black,
                  ),
                  title: Text(
                    AppLocalizations.of(context).translate("languageChange"),
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {
                    case4();
                  },
                ),
                Divider(
                  height: 0,
                  color: Colors.black,
                  thickness: 1,
                  indent: 5,
                  endIndent: 25,
                )
              ],
            ),
            loginORlogout
                ? Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.logout_outlined,
                          color: ColorForDesign().black,
                        ),
                        title: Text(
                          AppLocalizations.of(context).translate("LogOut"),
                          style: TextStyle(fontSize: 15),
                        ),
                        onTap: () async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.remove('userEmail');
                          Navigator.pushReplacementNamed(
                              context, nameroute.nameRouote_HomeScreen);

                          setState(() {
                            loginORlogout = !loginORlogout;
                          });
                        },
                      ),
                      Divider(
                        height: 0,
                        color: Colors.black,
                        thickness: 1,
                        indent: 5,
                        endIndent: 25,
                      )
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  case4() {
    if (lang.toString() == "en") {
      MyApp.setLocale(context, Locale('fr', ''));
    } else {
      MyApp.setLocale(context, Locale('en', ''));
    }
    Navigator.pop(context);
  }
}

class ListtileRForListdrwer extends StatelessWidget {
  String text;
  var opject;
  IconData iconForListTile;
  ListtileRForListdrwer({this.iconForListTile, this.opject, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            iconForListTile,
            color: ColorForDesign().black,
          ),
          title: Text(
            AppLocalizations.of(context).translate(text),
            style: TextStyle(fontSize: 15),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => opject));
          },
        ),
        Divider(
          height: 0,
          color: Colors.black,
          thickness: 1,
          indent: 5,
          endIndent: 25,
        )
      ],
    );
  }
}

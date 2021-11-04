import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/applocal.dart';
import 'package:first_app_for_test/main.dart';
import 'package:first_app_for_test/provider/drawerprovider.dart';
import 'package:first_app_for_test/screen/BottomNavigationBar/SettingsScreen.dart';
import 'package:first_app_for_test/screen/DrawerScreen/ContactUs.dart';
import 'package:first_app_for_test/screen/DrawerScreen/Franchise.dart';
import 'package:first_app_for_test/screen/DrawerScreen/Galary.dart';
import 'package:first_app_for_test/screen/DrawerScreen/PrivacyandPolicy.dart';
import 'package:first_app_for_test/screen/DrawerScreen/TermsAndConditions.dart';
import 'package:first_app_for_test/screen/DrawerScreen/ordersHistory.dart';
import 'package:first_app_for_test/screen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black38,
              ),
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset('lib/assets/Shraims_Logo.jpg'),
              ),
              otherAccountsPictures: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingScreen()));
                    },
                    icon: Icon(Icons.settings))
              ],
              accountName: Text('data'),
              accountEmail: !loginORlogout
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          icon: Container(
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Login"),
                                ],
                              ))),
                    )
                  : SizedBox(),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  ListtileRForListdrwer(
                    opject: Galary(),
                    text: "gallery",
                  ),
                  ListtileRForListdrwer(
                    opject: OrdersHistory(),
                    text: "ordersHistory",
                  ),
                  ListtileRForListdrwer(
                    opject: ContactUs(),
                    text: "ContactUs",
                  ),
                  //ListtileRForListdrwer(opject: Franchise(),text: "franchise",),
                  ListtileRForListdrwer(
                    opject: PrivacyAndPolicy(),
                    text: "PrivacyandPolicy",
                  ),
                  ListtileRForListdrwer(
                    opject: TermsAndConditions(),
                    text: "TermsandCondition",
                  ),
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          AppLocalizations.of(context)
                              .translate("languageChange"),
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
                              title: Text(
                                AppLocalizations.of(context)
                                    .translate("LogOut"),
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
  ListtileRForListdrwer({this.opject, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
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

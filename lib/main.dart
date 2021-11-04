import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/provider/CategoryImageprovaider.dart';
import 'package:first_app_for_test/provider/MenuCategoryprovider.dart';
import 'package:first_app_for_test/provider/MenuSubCategoryprovider.dart';
import 'package:first_app_for_test/screen/BottomNavigationBar/OrdarScreen.dart';
import 'package:first_app_for_test/screen/MenuCategoryScreen.dart';
import 'package:first_app_for_test/screen/ProductDetails.dart';
import 'package:first_app_for_test/screen/home_screen.dart';
import 'package:first_app_for_test/widget/Splash_Screen.dart';
import 'package:first_app_for_test/provider/drawerprovider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:first_app_for_test/applocal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    MyAppState state = context.findAncestorStateOfType<MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: DrawerProvider(),
          ),
          ChangeNotifierProvider.value(
            value: MenuCategoryProvider(),
          ),
          ChangeNotifierProvider.value(
            value: MenuProductProvider(),
          ),
          ChangeNotifierProvider.value(
            value: CategoryImageprocaider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: [
            Locale('en', ''),
            Locale('fr', ''),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          localeResolutionCallback: (currentLang, supportLang) {
            if (currentLang != null) {
              for (Locale local in supportLang) {
                if (local.languageCode == currentLang.languageCode) {
                  sharedPreferences.setString("lang", currentLang.languageCode);
                  print(currentLang.languageCode);
                  return currentLang;
                }
              }
            }
            return supportLang.first;
          },
          locale: _locale,
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: Splash(),
          routes: {
            nameroute.nameRouote_HomeScreen: (ctx) => HomeScreen(),
            nameroute.nameRouote_MenuCategoryForsupCategory: (ctx) =>
                MenuCategoryForsupCategory(),
            nameroute.nameRouote_OrdarScreen: (ctx) => OrdarScreen(),
            nameroute.nameRouote_ProductDetails: (ctx) => ProductDetails(),
          },
        ));
  }
}

class nameroute {
  static const nameRouote_HomeScreen = '/HomeScreen';
  static const nameRouote_OrdarScreen = '/OrdarScreen';
  static const nameRouote_MenuCategoryForsupCategory =
      '/MenuCategoryForsupCategory';
  static const nameRouote_ProductDetails = '/ProductDetails';
}

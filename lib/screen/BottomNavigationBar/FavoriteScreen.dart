import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/model/MenuProduct.dart';
import 'package:first_app_for_test/screen/BottomNavigationBar/OrdarScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class favoriteScreen extends StatefulWidget {
  const favoriteScreen({key}) : super(key: key);

  @override
  _favoriteScreenState createState() => _favoriteScreenState();
}

class _favoriteScreenState extends State<favoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (_, i) {
            return Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {},
                child: CardForsubcatogry(
                  image:
                      "https://helpx.adobe.com/content/dam/help/en/stock/how-to/visual-reverse-image-search/jcr_content/main-pars/image/visual-reverse-image-search-v2_intro.jpg",
                  price: 25,
                  textforname: "wafil",
                ),
              ),
            );
          }),
    );
  }
}

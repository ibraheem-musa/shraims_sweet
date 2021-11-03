import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/applocal.dart';
import 'package:first_app_for_test/main.dart';
import 'package:first_app_for_test/model/catgorymodel.dart';
import 'package:first_app_for_test/provider/CategoryImageprovaider.dart';
import 'package:first_app_for_test/provider/MenuCategoryprovider.dart';
import 'package:first_app_for_test/screen/BottomNavigationBar/OrdarScreen.dart';
import 'package:first_app_for_test/screen/MenuCategoryScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class MenuWidget extends StatefulWidget {
  const MenuWidget({key}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  List<Category> categorylistforshow;

  Future<List<Category>> _getCategory() async {
    String url = 'http://45.76.143.83/api/authentication/categories.php';
    var response = await http.post(
      Uri.parse(url),
    );
    // print(response.body);
    if (response.statusCode == 200) {
      final List<Category> categorylist = categoryFromJson(response.body);
      return categorylist;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCategory().then((categorylist) {
      setState(() {
        categorylistforshow = categorylist;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    MenuCategoryProvider drawerProvider =
        Provider.of<MenuCategoryProvider>(context, listen: false);
    CategoryImageprocaider categoryImageprocaider =
        Provider.of<CategoryImageprocaider>(context, listen: false);

    return Container(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          Category categoryApi = categorylistforshow[i];
          if (categorylistforshow.isEmpty) {
            return Text(
              'NO DATA',
              style: TextStyle(color: ColorForDesign().Gold),
            );
          } else {
            return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/MenuCategoryForsupCategory',
                      arguments: drawerProvider.menuCategory[i].id);
                },
                child: CardFormenu(
                  image: categoryImageprocaider.categoryImage[i].image,
                  text: categoryApi.nameEn,
                ));
          }
        },
        itemCount: null == categorylistforshow ? 0 : categorylistforshow.length,
      ),
    );
  }
}

class CardFormenu extends StatelessWidget {
  String image;
  String text;
  CardFormenu({this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      color: Color(0xAABF942E),
      child: Container(
        height: 180,
        width: 120,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              text,
              // AppLocalizations.of(context).translate(text),
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}

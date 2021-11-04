import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/model/MenuProduct.dart';
import 'package:first_app_for_test/model/catgorymodel.dart';
import 'package:first_app_for_test/provider/CategoryImageprovaider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:first_app_for_test/applocal.dart';
import 'package:first_app_for_test/provider/MenuCategoryprovider.dart';
import 'package:first_app_for_test/provider/MenuSubCategoryprovider.dart';

import 'package:provider/provider.dart';

class OrdarScreen extends StatefulWidget {
  const OrdarScreen({key}) : super(key: key);

  @override
  _OrdarScreenState createState() => _OrdarScreenState();
}

class _OrdarScreenState extends State<OrdarScreen> {
  List<Category> categorylistforshow;
  List<ProductCategory> productCategorylistforshow;

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

  Future<List<ProductCategory>> _getProductCategory(int id) async {
    String url =
        'http://45.76.143.83/api/authentication/productCategory.php?category_id=' +
            id.toString();
    var response = await http.post(
      Uri.parse(url),
    );
    // print(response.body);
    if (response.statusCode == 200) {
      final List<ProductCategory> productCategorylist =
          productCategoryFromJson(response.body);
      return productCategorylist;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProductCategory(1).then((productCategorylist) {
      setState(() {
        productCategorylistforshow = productCategorylist;
      });
    });
    _getCategory().then((categorylist) {
      setState(() {
        print("object");
        categorylistforshow = categorylist;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // MenuCategoryProvider menuCategoryProvider =
    //     Provider.of<MenuCategoryProvider>(context, listen: false);

    MenuProductProvider menuProductProvider =
        Provider.of<MenuProductProvider>(context, listen: false);
    CategoryImageprocaider categoryImageprocaider =
        Provider.of<CategoryImageprocaider>(context, listen: false);
    int idForcat = 0;

    return Container(
      color: ColorForDesign().black,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  Category categoryApi = categorylistforshow[index];
                  if (categorylistforshow.isEmpty) {
                    return Text(
                      'NO DATA',
                      style: TextStyle(color: ColorForDesign().Gold),
                    );
                  } else {
                    return GestureDetector(
                        onTap: () {
                          int a = categoryApi.id;

                          setState(() {
                            _getProductCategory(a).then((productCategorylist) {
                              setState(() {
                                productCategorylistforshow =
                                    productCategorylist;
                              });
                            });
                          });
                        },
                        child: cercilCard(
                          image:
                              categoryImageprocaider.categoryImage[index].image,
                          text: categoryApi.nameEn,
                        ));
                  }
                },
                itemCount: null == categorylistforshow
                    ? 0
                    : categorylistforshow.length,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: null == productCategorylistforshow
                      ? 0
                      : productCategorylistforshow.length,
                  itemBuilder: (_, i) {
                    ProductCategory productCategoryApi =
                        productCategorylistforshow[i];
                    if (productCategorylistforshow.isEmpty) {
                      print(" false");
                      return Text(
                        'NO DATA',
                        style: TextStyle(color: ColorForDesign().Gold),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          print(idForcat);
                        },
                        child: CardForsubcatogry(
                          image: menuProductProvider.menuProduct[1].logoimage,
                          price: productCategoryApi.price,
                          textforname: productCategoryApi.nameEn,
                        ),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class cercilCard extends StatelessWidget {
  String text;
  String image;
  cercilCard({this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(50.0),
        // ),
        color: Colors.transparent,
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    image,
                    height: MediaQuery.of(context).size.height / 10,
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                text, textAlign: TextAlign.center,
                // AppLocalizations.of(context).translate(text),
                style: TextStyle(
                  color: ColorForDesign().Gold,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardForsubcatogry extends StatelessWidget {
  String image;
  String textforname;
  int price;
  CardForsubcatogry({this.image, this.textforname, this.price});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber[200],
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(
                  image,
                  height: MediaQuery.of(context).size.height / 5,
                  width: 150,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        Text(
                          textforname,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Text(
                      price.toString() + ' \$',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

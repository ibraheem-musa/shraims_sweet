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
  ScrollController scrollController = ScrollController();
  bool scrolclosetop = false;

  double topcontainer = 0;
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
    // final double haightFor = MediaQuery.of(context).size.height / 6;
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      double value = scrollController.offset / 185;
      setState(() {
        topcontainer = value;
        scrolclosetop = scrollController.offset > 150;
        print(MediaQuery.of(context).size.height / 6);
      });
    });

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
            AnimatedContainer(
                height: !scrolclosetop
                    ? MediaQuery.of(context).size.height / 4
                    : MediaQuery.of(context).size.height / 5,
                duration: Duration(milliseconds: 200),
                child: Container(
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
                                _getProductCategory(a)
                                    .then((productCategorylist) {
                                  setState(() {
                                    productCategorylistforshow =
                                        productCategorylist;
                                  });
                                });
                              });
                            },
                            child: cercilCard(
                              image: categoryImageprocaider
                                  .categoryImage[index].image,
                              text: categoryApi.nameEn,
                              scrol: scrolclosetop,
                            ));
                      }
                    },
                    itemCount: null == categorylistforshow
                        ? 0
                        : categorylistforshow.length,
                  ),
                )),
            Expanded(
              child: ListView.builder(
                  controller: scrollController,
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
                      double scale = 1.0;
                      if (topcontainer > 0.5) {
                        scale = i + 0.5 - topcontainer;
                        if (scale < 0) {
                          scale = 0;
                        } else if (scale > 1) {
                          scale = 1;
                        }
                      }
                      return Opacity(
                        opacity: scale,
                        child: Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.identity()..scale(scale, scale),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                              onTap: () {
                                print(idForcat);
                              },
                              child: CardForsubcatogry(
                                image: menuProductProvider
                                    .menuProduct[1].logoimage,
                                price: productCategoryApi.price,
                                textforname: productCategoryApi.nameEn,
                              ),
                            ),
                          ),
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
  bool scrol;
  cercilCard({this.image, this.text, this.scrol});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
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
                !scrol
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      )
                    : SizedBox(
                        height: 0,
                      ),
                !scrol
                    ? Container(
                        child: Text(
                          text, textAlign: TextAlign.center,
                          // AppLocalizations.of(context).translate(text),
                          style: TextStyle(
                            color: ColorForDesign().Gold,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 0,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardForsubcatogry extends StatefulWidget {
  String image;
  String textforname;
  int price;
  CardForsubcatogry({this.image, this.textforname, this.price});

  @override
  State<CardForsubcatogry> createState() => _CardForsubcatogryState();
}

class _CardForsubcatogryState extends State<CardForsubcatogry> {
  bool favorte = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: ColorForDesign().black,
            border: Border.all(color: ColorForDesign().Gold, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 5, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.textforname,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorForDesign().Gold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' \$ ' + widget.price.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorForDesign().Gold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          favorte = !favorte;
                        });
                      },
                      icon: !favorte
                          ? Icon(
                              Icons.favorite_border,
                              color: Colors.redAccent,
                            )
                          : Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ))
                ],
              ),
              Image.asset(
                widget.image,
                height: MediaQuery.of(context).size.height / 5,
                width: 150,
                fit: BoxFit.contain,
              )
            ],
          ),
        ));
  }
}

class cardForProduct extends StatefulWidget {
  const cardForProduct({key}) : super(key: key);

  @override
  _cardForProductState createState() => _cardForProductState();
}

class _cardForProductState extends State<cardForProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "name",
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  // Text(
                  //   "brand",
                  //   style: const TextStyle(fontSize: 17, color: Colors.grey),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "",
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Image.asset(
                "imag",
                height: MediaQuery.of(context).size.height / 5,
                width: 150,
                fit: BoxFit.contain,
              )
            ],
          ),
        ));
  }
}

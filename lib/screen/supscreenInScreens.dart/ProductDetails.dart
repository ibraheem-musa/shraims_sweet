import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/model/productdetailsmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool timeDilation = false;
  int productID;
  List<ProductFeatures> productFeatureslistforshow;
//---------------------------------------------------------------------------------
  Future<List<ProductFeatures>> _getproductFeatures() async {
    productID = sharedPreferences.getInt("productCategoryApiid");
    String url =
        'http://45.76.143.83/api/authentication/productFeatures.php?product_id=' +
            productID.toString();
    var response = await http.post(
      Uri.parse(url),
    );
    // print(response.body);
    if (response.statusCode == 200) {
      final List<ProductFeatures> productFeatureslist =
          productFeaturesFromJson(response.body);
      print(productFeatureslist);
      return productFeatureslist;
    }
  }

//---------------------------------------------------------------------------------
  Future getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      // productID = sharedPreferences.getInt("productCategoryApiid");
      print(productID);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    print(productID.toString() + "From initstate");
    _getproductFeatures().then((productFeatureslist) {
      setState(() {
        productFeatureslistforshow = productFeatureslist;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var detalis = ModalRoute.of(context).settings.arguments as List;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorForDesign().black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Color(0x30bf942e),
              expandedHeight: MediaQuery.of(context).size.height / 3,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  detalis[1],
                  fit: BoxFit.fill,
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    detalis[0],
                    style: TextStyle(
                      color: ColorForDesign().Gold,
                    ),
                  ),
                ),
                centerTitle: true,
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                ProductFeatures productFeaturesApi =
                    productFeatureslistforshow[index];
                if (productFeatureslistforshow.isEmpty) {
                  print(productFeaturesApi.nameEn + "from chick");
                  return Text(
                    'NO DATA',
                    style: TextStyle(color: ColorForDesign().Gold),
                  );
                } else {
                  print(productFeaturesApi.nameEn + "from chick");
                  return Column(
                    children: [
                      Container(
                        height: 70,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                productFeaturesApi.labelEn,
                                style: TextStyle(
                                  color: ColorForDesign().Gold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 25,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "You can take just   " +
                                      productFeaturesApi.freeItems.toString() +
                                      "   of this For Free   ",
                                  style: TextStyle(
                                    color: ColorForDesign().Gold,
                                  )),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: ColorForDesign().Gold,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 70.0 * 3 + 10,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (_, i) {
                              return Container(
                                  height: 70,
                                  child: Theme(
                                    data: ThemeData(
                                      unselectedWidgetColor:
                                          ColorForDesign().Gold,
                                    ),
                                    child: CheckboxListTile(
                                      checkColor: ColorForDesign().black,
                                      // focusColor: ColorForDesign().Gold,
                                      // hoverColor: ColorForDesign().Gold,
                                      activeColor: ColorForDesign().Gold,
                                      title: Text(
                                        "free 2",
                                        style: TextStyle(color: Colors.amber),
                                      ),
                                      value: timeDilation,
                                      onChanged: (value) {
                                        print(productID);
                                        setState(() {
                                          timeDilation = value;
                                        });
                                      },
                                      secondary: Icon(
                                        Icons.arrow_right,
                                        color: ColorForDesign().Gold,
                                      ),
                                    ),
                                  ));
                            }),
                      )
                    ],
                  );
                }
              },
              childCount: null == productFeatureslistforshow
                  ? 0
                  : productFeatureslistforshow.length,
            ))
          ],
        ),
      ),
    );
  }
}

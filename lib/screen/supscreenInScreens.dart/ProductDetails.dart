import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/model/SubFeatures.dart';
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
  int id;
//---------------------------------------------------------------------------------

  List<ProductFeatures> productFeatureslistforshow;

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

//------------------------------------------------------------------------------
  List<SubFeature> subFeaturesforshow;

  Future<List<SubFeature>> _getsubFeatureses(int id) async {
    print(id.toString() + "  from  Future dupFeatureses ");
    String url =
        'http://45.76.143.83/api/authentication/subFeatures.php?feature_id=2';
    // id.toString();
    var response = await http.post(
      Uri.parse(url),
    );
    // print(response.body);
    if (response.statusCode == 200) {
      final List<SubFeature> subFeatureslist =
          subFeatureFromJson(response.body);
      print(subFeatureslist);
      return subFeatureslist;
    }
  }

//---------------------------------------------------------------------------------
  Future getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      // productID = sharedPreferences.getInt("productCategoryApiid");
    });
  }
//---------------------------------------------------------------------------------

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();

    _getproductFeatures().then((productFeatureslist) {
      setState(() {
        productFeatureslistforshow = productFeatureslist;
      });
    });
    // _getsubFeatureses().then((subFeatureslist) {
    //   setState(() {
    //     subFeaturesforshow = subFeatureslist;
    //   });
    // });
  }

//---------------------------------------------------------------------
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
              expandedHeight: MediaQuery.of(context).size.height / 2.5,
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
//--------------------------------------------------------------------

            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                ProductFeatures productFeaturesApi =
                    productFeatureslistforshow[index];
                if (productFeatureslistforshow.isEmpty) {
                  return Text(
                    'NO DATA',
                    style: TextStyle(color: ColorForDesign().Gold),
                  );
                } else {
                  print(productFeaturesApi.featureId.toString() + "ibrahom");

                  id = productFeaturesApi.id;

                  _getsubFeatureses(id).then((subFeatureslist) {
                    setState(() {
                      subFeaturesforshow = subFeatureslist;
                    });
                  });
                  return Column(
                    children: [
                      Container(
                        height: 70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      "You can take just   " +
                                          productFeaturesApi.freeItems
                                              .toString() +
                                          "   of this For Free   ",
                                      style: TextStyle(
                                        color: ColorForDesign().Gold,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      //------------------------------------------
                      Container(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, i) {
                            SubFeature subFeaturesApi = subFeaturesforshow[i];
//-------------------------------------------------------------
                            // _getsubFeatureses(id).then((subFeatureslist) {
                            //   setState(() {
                            //     subFeaturesforshow = subFeatureslist;
                            //   });
                            // });
                            print("object");

                            if (subFeaturesforshow.isEmpty) {
                              return Text(
                                'NO DATA',
                                style: TextStyle(color: ColorForDesign().Gold),
                              );
                            } else {
                              if (subFeaturesApi.id != null) {
                                return Column(
                                  children: [
                                    Container(
                                      height: 70 * 5.0,
                                      child: Text(
                                        subFeaturesApi.labelEn,
                                        style: TextStyle(
                                            color: ColorForDesign().Gold),
                                      ),

                                      //  Text(
                                      //   subFeaturesApi.labelEn,
                                      //   style: TextStyle(
                                      //       color: ColorForDesign().Gold),
                                      // ),
                                    ),

                                    // Container(
                                    //     height: 70,
                                    //     child: Theme(
                                    //       data: ThemeData(
                                    //         unselectedWidgetColor:
                                    //             ColorForDesign().Gold,
                                    //       ),
                                    //       child: CheckboxListTile(
                                    //         checkColor: ColorForDesign().black,
                                    //         activeColor: ColorForDesign().Gold,
                                    //         title: Text(
                                    //           subFeaturesApi.labelEn,
                                    //           style: TextStyle(
                                    //               color: ColorForDesign().Gold),
                                    //         ),
                                    //         value: timeDilation,
                                    //         onChanged: (value) {
                                    //           print(productID);
                                    //           setState(() {
                                    //             timeDilation = value;
                                    //           });
                                    //         },
                                    //         secondary: Icon(
                                    //           Icons.arrow_right,
                                    //           color: ColorForDesign().Gold,
                                    //         ),
                                    //       ),
                                    //     )),
                                  ],
                                );

                                //------------------------------------------------------------
                              } else {
                                return Container(
                                    height: 70,
                                    child: Theme(
                                      data: ThemeData(
                                        unselectedWidgetColor:
                                            ColorForDesign().Gold,
                                      ),
                                      child: CheckboxListTile(
                                        checkColor: ColorForDesign().black,
                                        activeColor: ColorForDesign().Gold,
                                        title: Text(
                                          subFeaturesApi.labelEn,
                                          style: TextStyle(
                                              color: ColorForDesign().Gold),
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
                              }
                            }
                          },
                          itemCount: null == subFeaturesforshow
                              ? 0
                              : subFeaturesforshow.length,
                        ),
                        height: 70.0 * 4,
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

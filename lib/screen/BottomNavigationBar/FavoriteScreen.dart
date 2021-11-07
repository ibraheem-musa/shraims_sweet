import 'package:first_app_for_test/model/MenuProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class favoriteScreen extends StatefulWidget {
  const favoriteScreen({key}) : super(key: key);

  @override
  _favoriteScreenState createState() => _favoriteScreenState();
}

class _favoriteScreenState extends State<favoriteScreen> {
  List<ProductCategory> productCategorylistforshow;

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

    _getProductCategory(1).then((productCategorylist) {
      setState(() {
        productCategorylistforshow = productCategorylist;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

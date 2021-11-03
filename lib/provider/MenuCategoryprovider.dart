import 'package:first_app_for_test/model/MenuCatogry.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';


class MenuCategoryProvider with ChangeNotifier{
List<MenuCatogry> menuCategory=[
MenuCatogry(id: 0,name: 'Specialty'),
MenuCatogry(id: 1,name: 'Desserts'   ),
MenuCatogry(id: 2,name: 'Drinks'    ),
MenuCatogry(id: 3,name: 'Snacks' ),
MenuCatogry(id: 4,name: 'family'),


];


//   Future <void> getdevaisfromaoi () async {
//     var url='http://45.76.143.83/api/authentication/categories.php';
//     var res =await http.get((Uri.parse(url)));
//     var jsonResult =json.decode(res.body)as Map<String,dynamic>;
//     List <MenuCatogry> tempList =[];

//     jsonResult.forEach((key,value){
//       MenuCatogry tempShop=MenuCatogry(
//           id:value['id'],
         

//       );
// tempList.add(tempShop);
//     });
//     menuCategory=tempList;
//     notifyListeners();
//   }

}
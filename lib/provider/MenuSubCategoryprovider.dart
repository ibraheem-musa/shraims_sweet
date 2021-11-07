import 'package:first_app_for_test/model/MenuProduct.dart';
import 'package:flutter/cupertino.dart';

class MenuProductProvider with ChangeNotifier {
  List<MenuProduct> menuProduct = [
    MenuProduct(
        idCategory: 0,
        id: 0,
        logoimage: 'lib/assets/Subcatogry/Crepe & Roll.png',
        name: 'Crepe & Roll',
        price: 25),
    MenuProduct(
        idCategory: 1,
        id: 1,
        logoimage: 'lib/assets/Subcatogry/Ice Cream.png',
        name: 'ice creem',
        price: 25),
    MenuProduct(
        idCategory: 2,
        id: 2,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
    MenuProduct(
        idCategory: 3,
        id: 3,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
    MenuProduct(
        idCategory: 3,
        id: 4,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
    MenuProduct(
        idCategory: 0,
        id: 0,
        logoimage: 'lib/assets/Subcatogry/Crepe & Roll.png',
        name: 'Crepe & Roll',
        price: 25),
    MenuProduct(
        idCategory: 1,
        id: 1,
        logoimage: 'lib/assets/Subcatogry/Ice Cream.png',
        name: 'ice creem',
        price: 25),
    MenuProduct(
        idCategory: 2,
        id: 2,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
    MenuProduct(
        idCategory: 3,
        id: 3,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
    MenuProduct(
        idCategory: 3,
        id: 4,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
    MenuProduct(
        idCategory: 0,
        id: 0,
        logoimage: 'lib/assets/Subcatogry/Crepe & Roll.png',
        name: 'Crepe & Roll',
        price: 25),
    MenuProduct(
        idCategory: 1,
        id: 1,
        logoimage: 'lib/assets/Subcatogry/Ice Cream.png',
        name: 'ice creem',
        price: 25),
    MenuProduct(
        idCategory: 2,
        id: 2,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
    MenuProduct(
        idCategory: 3,
        id: 3,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
    MenuProduct(
        idCategory: 3,
        id: 4,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
    MenuProduct(
        idCategory: 1,
        id: 1,
        logoimage: 'lib/assets/Subcatogry/Ice Cream.png',
        name: 'ice creem',
        price: 25),
    MenuProduct(
        idCategory: 2,
        id: 2,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
    MenuProduct(
        idCategory: 3,
        id: 3,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
    MenuProduct(
        idCategory: 3,
        id: 4,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
    MenuProduct(
        idCategory: 1,
        id: 1,
        logoimage: 'lib/assets/Subcatogry/Ice Cream.png',
        name: 'ice creem',
        price: 25),
    MenuProduct(
        idCategory: 2,
        id: 2,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
    MenuProduct(
        idCategory: 3,
        id: 3,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
    MenuProduct(
        idCategory: 3,
        id: 4,
        logoimage: "lib/assets/Subcatogry/Shraim's Milkshake.png",
        name: "Shraim's Milkshake",
        price: 25),
  ];

  List<MenuProduct> getfifiler(dynamic id) {
    if (id == null) {
      id = 1;
    }

    List<MenuProduct> filtercatgory;

    filtercatgory = MenuProductProvider().menuProduct.where((elemnt2) {
      return elemnt2.idCategory == id;
    }).toList();
    return filtercatgory;
  }
}

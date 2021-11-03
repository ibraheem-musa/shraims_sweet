// To parse this JSON data, do
//
//     final productCategory = productCategoryFromJson(jsonString);

import 'dart:convert';

List<ProductCategory> productCategoryFromJson(String str) =>
    List<ProductCategory>.from(
        json.decode(str).map((x) => ProductCategory.fromJson(x)));

String productCategoryToJson(List<ProductCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductCategory {
  ProductCategory({
    this.id,
    this.nameEn,
    this.nameFr,
    this.logo,
    this.price,
  });

  final int id;
  final String nameEn;
  final String nameFr;
  final String logo;
  final int price;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        id: json["id"],
        nameEn: json["name_en"],
        nameFr: json["name_fr"],
        logo: json["logo"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_fr": nameFr,
        "logo": logo,
        "price": price,
      };
}

//------------------------------------------------------------------
class MenuProduct {
  int id;
  int idCategory;
  String logoimage;
  String name;
  int price;

  MenuProduct(
      {this.id, this.idCategory, this.logoimage, this.name, this.price});
}

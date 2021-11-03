// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    this.id,
    this.nameEn,
    this.nameFr,
  });

  final int id;
  final String nameEn;
  final String nameFr;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        nameEn: json["name_en"],
        nameFr: json["name_fr"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_fr": nameFr,
      };
}

//-----CategoryImage-------------------
class CategoryImage {
  String image;
  String logoImage;
  CategoryImage({this.image, this.logoImage});
}

// To parse this JSON data, do
//
//     final productFeatures = productFeaturesFromJson(jsonString);

import 'dart:convert';

List<ProductFeatures> productFeaturesFromJson(String str) =>
    List<ProductFeatures>.from(
        json.decode(str).map((x) => ProductFeatures.fromJson(x)));

String productFeaturesToJson(List<ProductFeatures> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductFeatures {
  ProductFeatures({
    this.id,
    this.active,
    this.freeItems,
    this.productId,
    this.nameEn,
    this.nameFr,
    this.logo,
    this.price,
    this.featureId,
    this.labelEn,
    this.labelFr,
    this.value,
    this.featureLogo,
  });

  final int id;
  final int active;
  final int freeItems;
  final int productId;
  final String nameEn;
  final String nameFr;
  final String logo;
  final num price;
  final int featureId;
  final String labelEn;
  final String labelFr;
  final dynamic value;
  final dynamic featureLogo;

  factory ProductFeatures.fromJson(Map<String, dynamic> json) =>
      ProductFeatures(
        id: json["id"],
        active: json["active"],
        freeItems: json["free_items"],
        productId: json["productID"],
        nameEn: json["name_en"],
        nameFr: json["name_fr"],
        logo: json["logo"],
        price: json["price"],
        featureId: json["featureID"],
        labelEn: json["label_en"],
        labelFr: json["label_fr"],
        value: json["value"],
        featureLogo: json["featureLOGO"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "free_items": freeItems,
        "productID": productId,
        "name_en": nameEn,
        "name_fr": nameFr,
        "logo": logo,
        "price": price,
        "featureID": featureId,
        "label_en": labelEn,
        "label_fr": labelFr,
        "value": value,
        "featureLOGO": featureLogo,
      };
}

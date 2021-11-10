// To parse this JSON data, do
//
//     final itemFeatures = itemFeaturesFromJson(jsonString);

import 'dart:convert';

List<ItemFeatures> itemFeaturesFromJson(String str) => List<ItemFeatures>.from(
    json.decode(str).map((x) => ItemFeatures.fromJson(x)));

String itemFeaturesToJson(List<ItemFeatures> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemFeatures {
  ItemFeatures({
    this.id,
    this.nameEn,
    this.nameFr,
    this.labelEn,
    this.labelFr,
    this.value,
  });

  final int id;
  final String nameEn;
  final String nameFr;
  final String labelEn;
  final String labelFr;
  final dynamic value;

  factory ItemFeatures.fromJson(Map<String, dynamic> json) => ItemFeatures(
        id: json["id"],
        nameEn: json["name_en"],
        nameFr: json["name_fr"],
        labelEn: json["label_en"],
        labelFr: json["label_fr"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_fr": nameFr,
        "label_en": labelEn,
        "label_fr": labelFr,
        "value": value,
      };
}

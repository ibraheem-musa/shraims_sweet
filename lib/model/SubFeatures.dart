// To parse this JSON data, do
//
//     final subFeature = subFeatureFromJson(jsonString);

import 'dart:convert';

List<SubFeature> subFeatureFromJson(String str) =>
    List<SubFeature>.from(json.decode(str).map((x) => SubFeature.fromJson(x)));

String subFeatureToJson(List<SubFeature> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubFeature {
  SubFeature({
    this.id,
    this.labelEn,
    this.labelFr,
    this.value,
    this.featureId,
  });

  final int id;
  final String labelEn;
  final String labelFr;
  final String value;
  final int featureId;

  factory SubFeature.fromJson(Map<String, dynamic> json) => SubFeature(
        id: json["id"],
        labelEn: json["label_en"],
        labelFr: json["label_fr"],
        value: json["value"],
        featureId: json["feature_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label_en": labelEn,
        "label_fr": labelFr,
        "value": value,
        "feature_id": featureId,
      };
}

// To parse this JSON data, do
//
//     final aboutModel = aboutModelFromJson(jsonString);

import 'dart:convert';

class AboutModel {
  AboutModel({
    required this.id,
    required this.key,
    required this.value,
  });

  int id;
  String key;
  String value;

  factory AboutModel.fromRawJson(String str) =>
      AboutModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AboutModel.fromJson(Map<String, dynamic> json) => AboutModel(
        id: json["id"],
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
      };
}

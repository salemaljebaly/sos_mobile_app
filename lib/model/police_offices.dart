// To parse this JSON data, do
//
//     final policeOfficeModel = policeOfficeModelFromJson(jsonString);

import 'dart:convert';

class PoliceOfficeModel {
  PoliceOfficeModel({
    required this.id,
    required this.officeName,
    required this.officeCity,
    required this.longitude,
    required this.latitude,
    required this.createdAt,
    required this.updateAt,
  });

  int id;
  String officeName;
  String officeCity;
  String longitude;
  String latitude;
  DateTime createdAt;
  DateTime updateAt;

  factory PoliceOfficeModel.fromRawJson(String str) =>
      PoliceOfficeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PoliceOfficeModel.fromJson(Map<String, dynamic> json) =>
      PoliceOfficeModel(
          id: json["id"],
          officeName: json["office_name"],
          officeCity: json["office_city"],
          longitude: json["longitude"],
          latitude: json["latitude"],
          createdAt: DateTime.parse(json["createdAt"]),
          updateAt: DateTime.parse(json["updateAt"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "office_name": officeName,
        "office_city": officeCity,
        "longitude": longitude,
        "latitude": latitude,
        "createdAt": createdAt.toIso8601String(),
        "updateAt": updateAt.toIso8601String()
      };
}

import 'dart:convert';

class CitizenResponseModel {
  CitizenResponseModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phone,
    required this.isActive,
    required this.createdAt,
    required this.city,
    required this.longitude,
    required this.latitude,
  });

  int id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phone;
  bool isActive;
  DateTime createdAt;
  String city;
  String longitude;
  String latitude;

  factory CitizenResponseModel.fromRawJson(String str) =>
      CitizenResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CitizenResponseModel.fromJson(Map<String, dynamic> json) =>
      CitizenResponseModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        city: json["city"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "email": email,
        "phone": phone,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "city": city,
        "longitude": longitude,
        "latitude": latitude,
      };
}

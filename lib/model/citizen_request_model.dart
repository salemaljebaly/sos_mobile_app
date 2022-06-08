import 'dart:convert';

class CitizenRequestModel {
  CitizenRequestModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.isActive,
    required this.city,
    required this.longitude,
    required this.latitude,
  });

  String firstName;
  String lastName;
  String username;
  String email;
  String phone;
  String password;
  bool isActive;
  String city;
  String longitude;
  String latitude;

  factory CitizenRequestModel.fromRawJson(String str) =>
      CitizenRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CitizenRequestModel.fromJson(Map<String, dynamic> json) =>
      CitizenRequestModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        isActive: json["isActive"],
        city: json["city"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
        "isActive": isActive,
        "city": city,
        "longitude": longitude,
        "latitude": latitude,
      };
}

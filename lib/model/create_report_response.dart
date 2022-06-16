import 'dart:convert';

class CreateReportResponse {
  CreateReportResponse({
    required this.desc,
    required this.type,
    required this.state,
    required this.longitude,
    required this.latitude,
    required this.reporter,
    required this.reportFilePath,
    required this.fileType,
    required this.id,
    required this.createdAt,
    required this.updateAt,
  });

  String desc;
  String type;
  String state;
  String longitude;
  String latitude;
  Reporter reporter;
  dynamic reportFilePath;
  dynamic fileType;
  int id;
  DateTime createdAt;
  DateTime updateAt;

  factory CreateReportResponse.fromRawJson(String str) =>
      CreateReportResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateReportResponse.fromJson(Map<String, dynamic> json) =>
      CreateReportResponse(
        desc: json["desc"],
        type: json["type"],
        state: json["state"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        reporter: Reporter.fromJson(json["reporter"]),
        reportFilePath: json["reportFilePath"],
        fileType: json["fileType"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updateAt: DateTime.parse(json["updateAt"]),
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "type": type,
        "state": state,
        "longitude": longitude,
        "latitude": latitude,
        "reporter": reporter.toJson(),
        "reportFilePath": reportFilePath,
        "fileType": fileType,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updateAt": updateAt.toIso8601String(),
      };
}

class Reporter {
  Reporter({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phone,
    required this.isActive,
    required this.city,
  });

  int id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phone;
  bool isActive;
  String city;

  factory Reporter.fromRawJson(String str) =>
      Reporter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reporter.fromJson(Map<String, dynamic> json) => Reporter(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        isActive: json["isActive"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "email": email,
        "phone": phone,
        "isActive": isActive,
        "city": city,
      };
}

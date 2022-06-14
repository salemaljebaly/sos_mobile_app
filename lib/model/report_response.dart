import 'dart:convert';

class ReportResponse {
  ReportResponse({
    required this.id,
    required this.desc,
    required this.type,
    required this.state,
    required this.createdAt,
    required this.updateAt,
    required this.longitude,
    required this.latitude,
    required this.reportFilePath,
    required this.fileType,
    required this.reporter,
  });

  int id;
  String desc;
  String type;
  String state;
  String createdAt;
  String updateAt;
  String longitude;
  String latitude;
  dynamic reportFilePath;
  dynamic fileType;
  Reporter reporter;

  factory ReportResponse.fromRawJson(String str) =>
      ReportResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportResponse.fromJson(Map<String, dynamic> json) => ReportResponse(
        id: json["id"],
        desc: json["desc"],
        type: json["type"],
        state: json["state"],
        createdAt: json["createdAt"],
        updateAt: json["updateAt"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        reportFilePath: json["reportFilePath"],
        fileType: json["fileType"],
        reporter: Reporter.fromJson(json["reporter"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "desc": desc,
        "type": type,
        "state": state,
        "createdAt": createdAt,
        "updateAt": updateAt,
        "longitude": longitude,
        "latitude": latitude,
        "reportFilePath": reportFilePath,
        "fileType": fileType,
        "reporter": reporter.toJson(),
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
  String createdAt;
  String city;
  String longitude;
  String latitude;

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
        createdAt: json["createdAt"],
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
        "createdAt": createdAt,
        "city": city,
        "longitude": longitude,
        "latitude": latitude,
      };
}

import 'dart:convert';

class Report {
  Report({
    required this.type,
    required this.desc,
    required this.state,
    required this.longitude,
    required this.latitude,
  });

  String type;
  String desc;
  String state;
  String longitude;
  String latitude;

  factory Report.fromRawJson(String str) => Report.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        type: json["type"],
        desc: json["desc"],
        state: json["state"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "desc": desc,
        "state": state,
        "longitude": longitude,
        "latitude": latitude,
      };
}

enum ReportType { Fire, Ambulance, Accidant }

enum ReportState { pending, processing, done }

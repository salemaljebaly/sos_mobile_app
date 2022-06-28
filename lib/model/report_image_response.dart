import 'dart:convert';

class ReportImageResponse {
  ReportImageResponse({
    required this.imagePath,
  });

  String imagePath;

  factory ReportImageResponse.fromRawJson(String str) =>
      ReportImageResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportImageResponse.fromJson(Map<String, dynamic> json) =>
      ReportImageResponse(
        imagePath: json["imagePath"],
      );

  Map<String, dynamic> toJson() => {
        "imagePath": imagePath,
      };
}

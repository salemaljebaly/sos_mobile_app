import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos_mobile_app/controller/cache_token.dart';
import 'package:sos_mobile_app/model/create_report_response.dart';
import 'package:sos_mobile_app/model/report.dart';
import 'package:sos_mobile_app/model/report_response.dart';

class ReportService extends GetConnect {
  final String url = dotenv.env['API_URL'] as String;
  final String path = 'report';
  final GetStorage token = GetStorage();
  // -------------------------------------------------------------------------- //
  // create citizen account
  Future<CreateReportResponse?> create(Report model) async {
    final response = await post(
      "$url$path",
      model.toJson(),
      headers: {
        'Authorization': 'Bearer ${token.read(CacheTokenKey.token.toString())}',
      },
    );
    print(response.body);
    if (response.statusCode == HttpStatus.created) {
      return response.body;
    } else {
      return null;
    }
  }

  // -------------------------------------------------------------------------- //
  // get reports
  Future<Report?> findOne(int id) async {
    final response = await get(
      "$url$path/$id",
      headers: {
        'Authorization': 'Bearer ${token.read(CacheTokenKey.token.toString())}',
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      return Report.fromJson(response.body);
    } else {
      return null;
    }
  }

  // -------------------------------------------------------------------------- //
  // update reports
  Future<Response?> update(int id, Report model) async {
    final response = await patch(
      "$url$path/$id",
      model.toJson(),
      headers: {
        'Authorization': 'Bearer ${token.read(CacheTokenKey.token.toString())}',
      },
    );
    // todo fix parial problem -> fixed
    //fix phone number comes with +218
    if (response.statusCode == HttpStatus.ok) {
      return response;
    } else {
      return null;
    }
  }

  // -------------------------------------------------------------------------- //
  // update reports
  Future<List<ReportResponse>?> findAll() async {
    final response = await get(
      "$url$path/user",
      headers: {
        'Authorization': 'Bearer ${token.read(CacheTokenKey.token.toString())}',
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      List<ReportResponse> reportResponse = <ReportResponse>[];
      reportResponse.addAll(
          List.from(response.body).map((e) => ReportResponse.fromJson(e)));
      return reportResponse;
    } else {
      return null;
    }
  }

  // -------------------------------------------------------------------------- //
  // count reports
  Future<int?> count() async {
    final response = await get(
      "$url$path/count",
      headers: {
        'Authorization': 'Bearer ${token.read(CacheTokenKey.token.toString())}',
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      return int.parse(response.body);
    } else {
      return null;
    }
  }

  // -------------------------------------------------------------------------- //
  // upload report image
  Future<Response?> upload(int id, dynamic data) async {
    final form = FormData({
      'file': MultipartFile(data, filename: 'avatar.png'),
    });
    final response = await post("$url$path/upload", form, headers: {
      'Authorization': 'Bearer ${token.read(CacheTokenKey.token.toString())}',
    });
    if (response.statusCode == HttpStatus.ok) {
      return response.body;
    } else {
      return null;
    }
  }

  // -------------------------------------------------------------------------- //
  // get image by id
  Future<Response?> getImage(int id) async {
    final response = await get(
      "$url$path/upload/view/$id",
      headers: {
        'Authorization': 'Bearer ${token.read(CacheTokenKey.token.toString())}',
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      return response.body;
    } else {
      return null;
    }
  }
  // -------------------------------------------------------------------------- //
}

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos_mobile_app/controller/cache_token.dart';
import 'package:sos_mobile_app/model/police_offices.dart';

class PoliceService extends GetConnect {
  final String url = dotenv.env['API_URL'] as String;
  final String path = 'police-office';
  final GetStorage token = GetStorage();
  // -------------------------------------------------------------------------- //
  // update reports
  Future<List<PoliceOfficeModel>?> findAll() async {
    final response = await get(
      "$url$path",
      headers: {
        'Authorization': 'Bearer ${token.read(CacheTokenKey.token.toString())}',
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      List<PoliceOfficeModel> policeOfficeModel = <PoliceOfficeModel>[];
      policeOfficeModel.addAll(
          List.from(response.body).map((e) => PoliceOfficeModel.fromJson(e)));
      return policeOfficeModel;
    } else {
      return null;
    }
  }
  // -------------------------------------------------------------------------- //
}

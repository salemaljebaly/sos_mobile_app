import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos_mobile_app/controller/cache_token.dart';
import 'package:sos_mobile_app/model/about_model.dart';

class AboutService extends GetConnect {
  final String url = dotenv.env['API_URL'] as String;
  final String path = 'about';
  final GetStorage token = GetStorage();
  // -------------------------------------------------------------------------- //
  // update reports
  Future<List<AboutModel>?> findAll() async {
    final response = await get(
      "$url$path",
      headers: {
        'Authorization': 'Bearer ${token.read(CacheTokenKey.token.toString())}',
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      List<AboutModel> aboutModel = <AboutModel>[];
      aboutModel
          .addAll(List.from(response.body).map((e) => AboutModel.fromJson(e)));
      return aboutModel;
    } else {
      return null;
    }
  }
  // -------------------------------------------------------------------------- //
}

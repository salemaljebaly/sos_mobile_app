import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos_mobile_app/controller/cache_token.dart';
import 'package:sos_mobile_app/model/citizen_response_model.dart';
import 'package:sos_mobile_app/model/report.dart';

class AuthService extends GetConnect {
  final String url = dotenv.env['API_URL'] as String;
  final String path = 'report';
  final GetStorage token = GetStorage();
  // -------------------------------------------------------------------------- //
  // create citizen account
  Future<Response?> create(Report model) async {
    final response = await post(
      "$url$path",
      model.toJson(),
      headers: {
        'Authorization': 'Bearer ${token.read(CacheTokenKey.token.toString())}',
      },
    );
    if (response.statusCode == HttpStatus.created) {
      return response;
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
  Future<List<Report>?> findAll() async {
    final response = await get(
      "$url$path/user",
      headers: {
        'Authorization': 'Bearer ${token.read(CacheTokenKey.token.toString())}',
      },
    );
    // todo fix parial problem -> fixed
    //fix phone number comes with +218
    if (response.statusCode == HttpStatus.ok) {
      return response.body;
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
      return response.body;
    } else {
      return null;
    }
  }

  // -------------------------------------------------------------------------- //
  // upload report image
  Future<int?> upload(int id) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final form = FormData({
      'file': MultipartFile(image, filename: 'avatar.png'),
      'otherFile': MultipartFile(image, filename: 'cover.png'),
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
}

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:sos_mobile_app/model/auth_request_model.dart';
import 'package:sos_mobile_app/model/auth_response_model.dart';
import 'package:sos_mobile_app/model/citizen_request_model.dart';
import 'package:sos_mobile_app/model/citizen_response_model.dart';

class AuthService extends GetConnect {
  final String url = dotenv.env['API_URL'] as String;
  final String path = 'citizens';
  final String authPath = '/auth';
  // -------------------------------------------------------------------------- //
  Future<AuthResponseModel?> login(AuthModel model) async {
    final response = await post("$url$path$authPath", model.toJson());
    if (response.statusCode == HttpStatus.created) {
      return AuthResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  // -------------------------------------------------------------------------- //
  // create citizen account
  Future<Response?> create(CitizenRequestModel model) async {
    final response = await post("$url$path", model.toJson());
    if (response.statusCode == HttpStatus.created) {
      return response;
    } else {
      return null;
    }
  }

  // -------------------------------------------------------------------------- //
  // get citizen details
  Future<CitizenResponseModel?> findOne(int id, String token) async {
    final response = await get(
      "$url$path/$id",
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      return CitizenResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  // -------------------------------------------------------------------------- //
  // create citizen account
  Future<Response?> update(
      int id, CitizenRequestModel model, String token) async {
    final response = await patch(
      "$url$path/$id",
      model.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
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
}

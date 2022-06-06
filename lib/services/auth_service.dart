import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:sos_mobile_app/model/auth_request_model.dart';
import 'package:sos_mobile_app/model/auth_response_model.dart';

class AuthService extends GetConnect {
  final String loginUrl = dotenv.env['API_URL'] as String;
  final String path = 'citizens';
  final String authPath = '/auth';

  Future<AuthResponseModel?> login(AuthModel model) async {
    final response = await post("$loginUrl $path $authPath", model.toJson());
    print('------------------------------------------------------');
    print(response.statusCode == 201);
    print(response.headers);
    print(response.request);
    print(response.body);
    print('------------------------------------------------------');
    if (response.statusCode == HttpStatus.created) {
      return AuthResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}

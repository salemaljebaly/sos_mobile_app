import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:sos_mobile_app/model/auth_model.dart';

class UsersService extends GetConnect {
  final String loginUrl = dotenv.env['API_URL'] as String;
  final String path = 'auth';

  Future<AuthModel?> login(AuthModel model) async {
    final response = await post(loginUrl + path, model.toJson());

    response.statusCode == HttpStatus.ok
        ? AuthModel.fromJson(response.body)
        : null;
  }
}

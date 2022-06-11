import 'dart:convert';

import 'package:get/get.dart';
import 'package:sos_mobile_app/controller/cache_token.dart';

class AuthManager extends GetxController with CacheToken {
  final RxBool isLogin = false.obs;
  void logOut() {
    isLogin.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogin.value = true;
    // Token is cache
    await saveToken(token);
  }

  String? getAuthToken() => getToken();

  // check user token
  void checkLoginSatus() {
    final token = getToken();
    token != null ? isLogin.value = true : isLogin.value = false;
  }

  // get id form user token
  int getUserIdFromToken(String code) {
    String normalizedSource = base64Url.normalize(code.split(".")[1]);
    String res = utf8.decode(base64Url.decode(normalizedSource));
    Map<String, dynamic> responseJson = json.decode(res);
    return responseJson['id'];
  }
}

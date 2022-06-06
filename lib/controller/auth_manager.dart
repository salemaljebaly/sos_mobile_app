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

  void checkLoginSatus() {
    final token = getToken();
    token != null ? isLogin.value = true : isLogin.value = false;
  }
}

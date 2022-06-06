import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxBool isLogin = false.obs;
  void logOut() {
    isLogin.value = false;
  }
}

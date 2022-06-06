import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/controller/auth_manager.dart';
import 'package:sos_mobile_app/model/auth_request_model.dart';
import 'package:sos_mobile_app/services/auth_service.dart';

class AuthController extends GetxController {
  late final AuthService _authService;
  late final AuthManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _authService = Get.put(AuthService());
    _authManager = Get.find();
  }

  // ------------------------------------------------------------------------ //
  // execute login
  Future<void> loginUser(String username, String password) async {
    final response = await _authService
        .login(AuthModel(username: username, password: password));

    print(await _authService
        .login(AuthModel(username: username, password: password)));
    if (response != null) {
      print('login . > >');
      _authManager.login(response.accessToken);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
  // ------------------------------------------------------------------------ //
}

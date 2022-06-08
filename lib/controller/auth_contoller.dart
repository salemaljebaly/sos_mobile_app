import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/controller/auth_manager.dart';
import 'package:sos_mobile_app/model/auth_request_model.dart';
import 'package:sos_mobile_app/model/citizen_request_model.dart';
import 'package:sos_mobile_app/services/auth_service.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/view/home_screen.dart';

class AuthController extends GetxController {
  late final AuthService _authService;
  late final AuthManager _authManager;
  RxBool isCitizenCreated = false.obs;

  @override
  void onInit() {
    super.onInit();
    _authService = Get.put(AuthService());
    _authManager = Get.find();
  }

  // ------------------------------------------------------------------------ //
  // execute login
  Future<void> loginUser(String username, String password) async {
    _authManager.logOut();
    final response = await _authService
        .login(AuthModel(username: username, password: password));

    if (response != null) {
      isCitizenCreated.value = true;
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
  // ------------------------------------------------------------------------ //
  // execute login
  Future<void> createCitizen(CitizenRequestModel citizenRequestModel) async {
    final response = await _authService.create(citizenRequestModel);

    // print(response.toString());
    if (response != null) {
      print(response.body);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'some thing wrong',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
  // ------------------------------------------------------------------------ //
}

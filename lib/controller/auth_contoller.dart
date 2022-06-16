import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/controller/auth_manager.dart';
import 'package:sos_mobile_app/model/auth_request_model.dart';
import 'package:sos_mobile_app/model/citizen_request_model.dart';
import 'package:sos_mobile_app/model/citizen_response_model.dart';
import 'package:sos_mobile_app/routes/app_pages.dart';
import 'package:sos_mobile_app/services/auth_service.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/view/home_screen.dart';

class AuthController extends GetxController {
  late final AuthService _authService;
  late final AuthManager _authManager;
  RxBool isCitizenCreated = false.obs;
  RxDouble citizenLatitude = 0.0.obs;
  RxDouble citizenLongitude = 0.0.obs;
  // listen to citizen values //
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString city = ''.obs;
  RxString latitude = ''.obs;
  RxString longitude = ''.obs;

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
    // navigate to homescreen
    if (response != null) {
      isCitizenCreated.value = true;
      _authManager.saveToken(response.accessToken);
      Get.offNamed(Routes.CITIZEN);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
        middleText: Strings.dontHaveAccount,
        textConfirm: Strings.ok,
        confirmTextColor: Colors.white,
        buttonColor: Colors.red[300],
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  // ------------------------------------------------------------------------ //
  // create citizen
  Future<void> createCitizen(CitizenRequestModel citizenRequestModel) async {
    final response = await _authService.create(citizenRequestModel);

    if (response != null) {
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
        middleText: Strings.someThingWrong,
        textConfirm: Strings.ok,
        confirmTextColor: Colors.white,
        buttonColor: Colors.red[300],
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  // ------------------------------------------------------------------------ //
  // create citizen
  Future<CitizenResponseModel?> findOne() async {
    int id =
        _authManager.getUserIdFromToken(_authManager.getAuthToken().toString());
    final response =
        await _authService.findOne(id, _authManager.getAuthToken().toString());
    if (response != null) {
      // _authManager
      //     .storeCitizenData(CitizenResponseModel.fromJson(response.toJson()));
      firstName.value = response.firstName;
      lastName.value = response.lastName;
      email.value = response.email;
      username.value = response.username;
      phone.value = response.phone;
      city.value = response.city;
      latitude.value = response.latitude;
      longitude.value = response.longitude;
      return response;
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
        middleText: Strings.someThingWrong,
        textConfirm: Strings.ok,
        confirmTextColor: Colors.white,
        buttonColor: Colors.red[300],
        onConfirm: () {
          Get.back();
        },
      );

      return null;
    }
  }

  // ------------------------------------------------------------------------ //
  // create citizen
  Future<void> updateOne(
    CitizenRequestModel citizenRequestModel,
  ) async {
    int id =
        _authManager.getUserIdFromToken(_authManager.getAuthToken().toString());
    final response = await _authService.update(
        id, citizenRequestModel, _authManager.getAuthToken().toString());

    if (response != null) {
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
        middleText: Strings.someThingWrong,
        textConfirm: Strings.ok,
        confirmTextColor: Colors.white,
        buttonColor: Colors.red[300],
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  // ------------------------------------------------------------------------ //
  void logOut() => _authManager.logOut();
}

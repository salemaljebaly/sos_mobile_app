import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/model/about_model.dart';
import 'package:sos_mobile_app/services/about_service.dart';
import 'package:sos_mobile_app/utils/strings.dart';

class AboutConteroller extends GetxController {
  late final AboutService _aboutService;
  RxList<AboutModel> abouts = <AboutModel>[].obs;
  RxInt aboutListCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _aboutService = Get.put(AboutService());
    // _authManager = Get.find();
  }

  // get all  report
  Future<List<AboutModel>> findAll() async {
    final response = await _aboutService.findAll();
    if (response != null) {
      aboutListCount.value = response.length;
      abouts.value = response;
      return response;
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          buttonColor: Colors.red[200],
          middleText: Strings.someThingWrong,
          textConfirm: Strings.ok,
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
    return [];
  }
}

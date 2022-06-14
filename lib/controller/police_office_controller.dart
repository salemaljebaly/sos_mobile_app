import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/model/police_offices.dart';
import 'package:sos_mobile_app/services/polic_service.dart';
import 'package:sos_mobile_app/utils/strings.dart';

class PoliceOfficeConteroller extends GetxController {
  late final PoliceService _policeService;
  // RxList<ReportResponse> reports = <ReportResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    _policeService = Get.put(PoliceService());
    // _authManager = Get.find();
  }

  // get all  report
  Future<List<PoliceOfficeModel>> findAll() async {
    final response = await _policeService.findAll();

    print(response.runtimeType);
    print(response![0].officeCity);
    if (response != null) {
      // reports.value = response;
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

  // ------------------------------------------------------------------------ //
  // count reports
  // Future<int?> count() async {
  //   final response = await _policeService.count();

  //   if (response != null) {
  //     return response;
  //   } else {
  //     /// Show user a dialog about the error response
  //     Get.defaultDialog(
  //         buttonColor: Colors.red[200],
  //         middleText: Strings.someThingWrong,
  //         textConfirm: Strings.ok,
  //         confirmTextColor: Colors.white,
  //         onConfirm: () {
  //           Get.back();
  //         });
  //   }
  //   return 0;
  // }
}

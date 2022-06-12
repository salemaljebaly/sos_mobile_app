import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos_mobile_app/controller/auth_manager.dart';
import 'package:sos_mobile_app/model/report.dart';
import 'package:sos_mobile_app/services/report_service.dart';
import 'package:sos_mobile_app/utils/strings.dart';

class ReportConteroller extends GetxController {
  late final ReportService _reportService;
  late final AuthManager _authManager;
  // listen to citizen values //
  RxString reportdesc = ''.obs;
  RxString reportState = ''.obs;
  RxString reportType = ''.obs;
  RxString latitude = ''.obs;
  RxString longitude = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _reportService = Get.put(ReportService());
    _authManager = Get.find();
  }

  // ------------------------------------------------------------------------ //
  // create report
  Future<void> create(Report model) async {
    final response = await _reportService.create(model);

    print(response.toString());
    if (response != null) {
      print(response.body);
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
  }

  // ------------------------------------------------------------------------ //
  // find one report
  Future<Report?> findOne(int id) async {
    final response = await _reportService.findOne(id);
    print(response.runtimeType);
    if (response != null) {
      reportState.value = response.state;
      reportdesc.value = response.desc;
      reportType.value = response.type;
      latitude.value = response.latitude;
      longitude.value = response.longitude;
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

      return null;
    }
  }

  // ------------------------------------------------------------------------ //
  // update  report
  Future<void> updateOne(
    int id,
    Report model,
  ) async {
    final response = await _reportService.update(id, model);

    print(response.toString());
    if (response != null) {
      print(response.body);
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
  }

  // ------------------------------------------------------------------------ //
  // get all  report
  Future<List<Report>> findAll() async {
    final response = await _reportService.findAll();

    print(response.toString());
    if (response != null) {
      print(response);
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
  Future<int> count() async {
    final response = await _reportService.count();

    print(response.toString());
    if (response != null) {
      print(response);
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
    return 0;
  }

  // ------------------------------------------------------------------------ //
  // get all  report
  Future<int> upload(int id) async {
    // pick image from gellary
    final data = await ImagePicker().pickImage(source: ImageSource.gallery);
    final response = await _reportService.upload(id, data);

    print(response.toString());
    if (response != null) {
      print(response);
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
    return 0;
  }

  // ------------------------------------------------------------------------ //
  // get all  report
  Future<Response?> getImage(int id) async {
    final response = await _reportService.getImage(id);

    print(response.toString());
    if (response != null) {
      print(response);
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
    return null;
  }
}
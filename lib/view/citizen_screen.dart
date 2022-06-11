import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos_mobile_app/controller/auth_manager.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/utils/widgets/drawer.dart';

class CitizenScreen extends StatelessWidget {
  CitizenScreen({Key? key}) : super(key: key);
  final box = GetStorage();
  final AuthManager _authManager = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text(Strings.appName),
        ),
        body: Center(child: Text(_authManager.getCitizenData()!.city)));
  }
}

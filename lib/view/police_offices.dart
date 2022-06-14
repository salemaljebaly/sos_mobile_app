import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/controller/police_office_controller.dart';
import 'package:sos_mobile_app/utils/widgets/drawer.dart';

class PoliceOfficeScreen extends StatefulWidget {
  const PoliceOfficeScreen({Key? key}) : super(key: key);

  @override
  State<PoliceOfficeScreen> createState() => _PoliceOfficeScreenState();
}

class _PoliceOfficeScreenState extends State<PoliceOfficeScreen> {
  final PoliceOfficeConteroller _policeOfficeConteroller =
      Get.put(PoliceOfficeConteroller());
  @override
  void initState() {
    _policeOfficeConteroller.findAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: AppDrawer(), body: Center(child: Text('test')));
  }
}

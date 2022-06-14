import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/controller/police_office_controller.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/utils/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void _launchUrl(int index) async {
    final Uri _url = Uri.parse(
        'https://maps.google.com/?q=${_policeOfficeConteroller.policeOffices[index].latitude}, ${_policeOfficeConteroller.policeOffices[index].longitude}');
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          Strings.policeOffices,
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _policeOfficeConteroller.policeListCount.value,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(
                Icons.local_police_outlined,
                color: Colors.red,
              ),
              trailing: Text(
                // _reportConteroller.reports.value.toString(),
                _policeOfficeConteroller.policeOffices[index].officeCity,
                style: const TextStyle(color: Colors.black45, fontSize: 15),
              ),
              title: Text(
                _policeOfficeConteroller.policeOffices[index].officeName,
              ),
              onTap: () => _launchUrl(index),
            );
          },
        ),
      ),
    );
  }
}

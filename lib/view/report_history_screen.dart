import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/controller/report_controller.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/utils/widgets/drawer.dart';

class ReportHistory extends StatefulWidget {
  ReportHistory({Key? key}) : super(key: key);
  @override
  _ReportHistoryState createState() => _ReportHistoryState();
}

class _ReportHistoryState extends State<ReportHistory> {
  final ReportConteroller _reportConteroller = Get.put(ReportConteroller());
  @override
  void initState() {
    _reportConteroller.findAll();
    Timer(const Duration(seconds: 2), () {
      if (_reportConteroller.reports.isEmpty) {
        // message to user
        Get.back();
      }
    });

    print(_reportConteroller.reportCount.value.toString());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(Strings.reports_history),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _reportConteroller.reportCount.value,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(
                Icons.file_open_rounded,
                color: Colors.redAccent,
              ),
              trailing: Text(
                // _reportConteroller.reports.value.toString(),
                arabicState(_reportConteroller.reports[index].state),
                style: const TextStyle(color: Colors.lightGreen, fontSize: 15),
              ),
              title: Text(_reportConteroller.reports[index].desc),
              onTap: () {
                Get.snackbar(
                  Strings.report,
                  Strings.reportSent,
                  snackPosition: SnackPosition.BOTTOM,
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  duration: const Duration(seconds: 1),
                );
              },
            );
          },
        ),
      ),
    );
  }

  // check the state of report and return arabic string
  String arabicState(String state) {
    switch (state) {
      case 'pending':
        return Strings.pending;
      case 'processing':
        return Strings.processing;
      case 'done':
        return Strings.done;
      default:
        {
          return Strings.pending;
        }
    }
  }
}

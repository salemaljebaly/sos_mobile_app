import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/controller/report_controller.dart';
import 'package:sos_mobile_app/model/report.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/utils/widgets/drawer.dart';
import 'package:timelines/timelines.dart';

class ReportHistory extends StatefulWidget {
  ReportHistory({Key? key}) : super(key: key);
  @override
  _ReportHistoryState createState() => _ReportHistoryState();
}

class _ReportHistoryState extends State<ReportHistory> {
  final ReportConteroller _reportConteroller = Get.put(ReportConteroller());
  @override
  void initState() {
    _reportConteroller.count();
    // _reportConteroller.findAll();
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
              leading: const Icon(Icons.file_open_rounded),
              trailing: Text(
                // _reportConteroller.reports.value.toString(),
                Strings.Fire,
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
              title: Text("${Strings.reportSent}  ${index + 1}"),
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
}

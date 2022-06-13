import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/controller/report_controller.dart';
import 'package:sos_mobile_app/model/report.dart';
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
    _reportConteroller.findAll();
    print('report count' + _reportConteroller.reportCount.value.toString());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Report History'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _reportConteroller.reportCount.value,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.file_open_rounded),
                trailing: Text(
                  _reportConteroller.reports.value.toString(),
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("List item $index"));
          },
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/controller/auth_contoller.dart';
import 'package:sos_mobile_app/controller/report_controller.dart';
import 'package:sos_mobile_app/model/report.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/view/current_location_screen.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late Report model;
  ReportConteroller _reportConteroller = Get.put(ReportConteroller());
  TextEditingController desc = TextEditingController();
  String selectedItem = ReportType.Fire.toString();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: TextFormField(
                controller: desc,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? Strings.emptyUsername
                      : null;
                },
                decoration: InputDecoration(
                  label: Text(Strings.password),
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                onPressed: () {
                  // convert to getx dialog and fix width
                  showDialog(
                      context: context,
                      builder: (_) {
                        return const AlertDialog(
                          contentPadding: EdgeInsets.all(0),
                          content: CurrentLocationScreen(),
                        );
                      });
                },
                icon: const Icon(Icons.location_on_sharp),
                label: const Text('الموقع'),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
          ],
        ),
        ListTile(
          leading: const Icon(
            Icons.emergency,
            color: Colors.red,
          ),
          title: DropdownButton(
              value: ReportType.Fire.toString(),
              onChanged: (String? item) {
                setState(() {
                  selectedItem = item!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: ReportType.Fire.toString(),
                  child: Text(Strings.Fire.toString()),
                ),
                DropdownMenuItem(
                  value: ReportType.Fire.toString(),
                  child: Text(Strings.Accidant.toString()),
                ),
                DropdownMenuItem(
                  value: ReportType.Fire.toString(),
                  child: Text(Strings.Ambulance.toString()),
                ),
              ]),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              model = Report(
                desc: desc.text,
                type: selectedItem,
                state: ReportState.pending.toString(),
                longitude: _reportConteroller.latitude.value.toString(),
                latitude: _reportConteroller.longitude.value.toString(),
              );
              _reportConteroller.create(model);
            },
            child: Text(Strings.sendReport),
          ),
        ),
      ],
    );
  }
}

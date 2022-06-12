import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/controller/auth_contoller.dart';
import 'package:sos_mobile_app/controller/report_controller.dart';
import 'package:sos_mobile_app/model/report.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/utils/widgets/drawer.dart';
import 'package:sos_mobile_app/view/current_location_screen.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late Report model;
  final ReportConteroller _reportConteroller = Get.put(ReportConteroller());
  TextEditingController desc = TextEditingController();
  // dropdown items
  List<String> items = ['Fire', 'Ambulance', 'Accidant'];
  String selectedItem = 'Fire';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(Strings.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.file_open_rounded,
                size: 100,
                color: Colors.red,
              ),
            ),
            Text(
              Strings.sendReport,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20.0),
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
                      label: Text(Strings.reportDesc),
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
                value: selectedItem,
                onChanged: (String? item) => setState(() => {
                      selectedItem = item!,
                      print(selectedItem),
                    }),
                items: items
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                        ),
                      ),
                    )
                    .toList(),

                // [
                //   DropdownMenuItem(
                //     value: 'Fire',
                //     child: Text(Strings.Fire.toString()),
                //   ),
                //   DropdownMenuItem(
                //     value: 'Accidant',
                //     child: Text(Strings.Accidant.toString()),
                //   ),
                //   DropdownMenuItem(
                //     value: 'Ambulance',
                //     child: Text(Strings.Ambulance.toString()),
                //   ),
                // ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: double.infinity,
                height: 58.0,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1.0, color: Colors.red),
                  ),
                  onPressed: () async {
                    //  TODO fix request
                    model = Report(
                      desc: desc.text,
                      type: selectedItem,
                      state: 'pending',
                      longitude: _reportConteroller.latitude.value.toString(),
                      latitude: _reportConteroller.longitude.value.toString(),
                    );
                    print(model.toRawJson());
                    // _reportConteroller.create(model);
                  },
                  child: Text(
                    Strings.sendReport,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

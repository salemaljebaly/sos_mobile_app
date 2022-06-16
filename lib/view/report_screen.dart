import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
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
  // --------------------------------------------------------------------------- //
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
        print('image' + image.toString());
      });
    } on PlatformException catch (e) {
      print('failed to pick file: $e');
    }
  }

  // --------------------------------------------------------------------------- //
  late Report model;
  final ReportConteroller _reportConteroller = Get.put(ReportConteroller());
  TextEditingController desc = TextEditingController();
  // dropdown items
  List<String> items = ['Fire', 'Ambulance', 'Accidant'];
  List<String> arabicItems = ['حريق', 'اسعاف', 'حادث'];
  String selectedItem = 'Fire';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(Strings.createReport, style: const TextStyle(fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 4, 2, 4),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.grey))),
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
                              arabicItems[items.indexOf(item)],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(4.0),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: buildButton(
              //           icon: Icons.image_outlined,
              //           title: 'صورة مخزنة',
              //           onClicked: () => pickImage(ImageSource.gallery),
              //         ),
              //       ),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //         child: buildButton(
              //           icon: Icons.camera_outlined,
              //           title: 'التقاط صورة',
              //           onClicked: () => pickImage(ImageSource.camera),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
                        longitude:
                            _reportConteroller.longitude.value.toString(),
                        latitude: _reportConteroller.latitude.value.toString(),
                      );

                      _reportConteroller.create(model);
                      // Future.delayed(const Duration(seconds: 1));
                      // print('id from report' +
                      //     _reportConteroller.reportId.value.toString());
                      // _reportConteroller.upload(
                      //     _reportConteroller.reportId.value, this.image);
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
      ),
    );
  }

  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(58),
          primary: Colors.white,
          onPrimary: Colors.black,
          textStyle: GoogleFonts.almarai(
            fontSize: 14,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(title)
          ],
        ),
        onPressed: onClicked,
      );
}

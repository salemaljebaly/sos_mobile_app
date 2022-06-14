import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/controller/about_controller.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/utils/widgets/drawer.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final AboutConteroller _aboutConteroller = Get.put(AboutConteroller());
  @override
  void initState() {
    _aboutConteroller.findAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          Strings.about,
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _aboutConteroller.aboutListCount.value,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.info,
                        color: Colors.black38,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        _aboutConteroller.abouts[index].key,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        _aboutConteroller.abouts[index].value,
                        style: const TextStyle(height: 1.8),
                      ),
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}

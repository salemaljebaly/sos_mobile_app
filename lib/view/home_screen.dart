import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/utils/strings.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // Obx(
        //   () => Text("Clicks: ${myController.count}"),
        // ),
      ),
      body: Center(
        child:
            ElevatedButton(child: Text(Strings.appName), onPressed: () => {}),
      ),
    );
  }
}

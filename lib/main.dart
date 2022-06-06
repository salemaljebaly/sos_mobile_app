import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/view/home_screen.dart';

void main() async {
  // load .env file
  await dotenv.load();
  runApp(const MyApp());
}

// --------------------------------------------------------------------------- //
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red[400]),
      home: HomeScreen(
        title: Strings.appName,
      ),
    );
  }
}
  // --------------------------------------------------------------------------- //


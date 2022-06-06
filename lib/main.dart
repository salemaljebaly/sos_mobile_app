import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/routes/app_pages.dart';
import 'package:sos_mobile_app/splash_screen.dart';

void main() async {
  // load .env file
  await dotenv.load();
  // run app
  runApp(const MyApp());
}

// --------------------------------------------------------------------------- //
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // --------------------------------------------------------------------------- //
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red[400]),
      home: SplashScreen(),
      getPages: AppPages.routes,
    );
  }
  // --------------------------------------------------------------------------- //
}

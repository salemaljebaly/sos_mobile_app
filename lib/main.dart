import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos_mobile_app/routes/app_pages.dart';
import 'package:sos_mobile_app/splash_screen.dart';
import 'package:sos_mobile_app/theme/theme.dart';

void main() async {
  // init GetStorage
  await GetStorage.init();
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
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: SplashScreen(),
      getPages: AppPages.routes,
    );
  }
  // --------------------------------------------------------------------------- //
}

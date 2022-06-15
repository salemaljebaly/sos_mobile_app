import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/controller/auth_manager.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/view/citizen_screen.dart';
import 'package:sos_mobile_app/view/home_screen.dart';
import 'package:sos_mobile_app/view/login_screen.dart';

class SplashScreen extends StatelessWidget {
  final AuthManager _authmanager = Get.put(AuthManager());

  SplashScreen({Key? key}) : super(key: key);
  // --------------------------------------------------------------------------- //
  Future<void> initializeSettings() async {
    _authmanager.checkLoginSatus();
    await Future.delayed(const Duration(seconds: 1));
  }
  // --------------------------------------------------------------------------- //

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return _authmanager.isLogin.value
                ? CitizenScreen()
                : const LoginScreen();
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
          Text('Loading...'),
        ],
      ),
    ));
  }
}

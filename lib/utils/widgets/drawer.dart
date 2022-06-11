import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos_mobile_app/controller/auth_contoller.dart';
import 'package:sos_mobile_app/controller/auth_manager.dart';
import 'package:sos_mobile_app/controller/cache_token.dart';
import 'package:sos_mobile_app/model/citizen_response_model.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/view/citizen_screen.dart';
import 'package:sos_mobile_app/view/home_screen.dart';
import 'package:sos_mobile_app/view/login_screen.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);
  final box = GetStorage();
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture:
                  SvgPicture.asset('assets/icons/sos_logo.svg'),
              accountName: Text('fullname'),
              accountEmail: Text('email')),
          ListTile(
            leading: const Icon(
              Icons.person_rounded,
              color: Colors.red,
            ),
            title: Text(Strings.myAccount),
            onTap: () {
              _authController.findOne();
              Get.to(() => CitizenScreen());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.file_copy,
              color: Colors.red,
            ),
            title: Text(Strings.reports),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.local_police,
              color: Colors.red,
            ),
            title: Text(Strings.policeOffices),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.red,
            ),
            title: Text(Strings.about),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_rounded,
              color: Colors.red,
            ),
            title: Text(Strings.logout),
            onTap: () {
              _authController.logOut();
              Navigator.pop(context);
              Get.to(() => const LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/view/about_screen.dart';
import 'package:sos_mobile_app/view/citizen_screen.dart';
import 'package:sos_mobile_app/view/home_screen.dart';
import 'package:sos_mobile_app/view/login_screen.dart';
import 'package:sos_mobile_app/view/police_offices.dart';
import 'package:sos_mobile_app/view/report_history_screen.dart';
import 'package:sos_mobile_app/view/report_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(title: Strings.appName),
    ),
    GetPage(
      name: Routes.REPORT,
      page: () => const ReportScreen(),
    ),
    GetPage(
      name: Routes.CITIZEN,
      page: () => CitizenScreen(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.REPORT_HISTORY,
      page: () => ReportHistory(),
    ),
    GetPage(
      name: Routes.POLICE_OFFICES,
      page: () => const PoliceOfficeScreen(),
    ),
    GetPage(
      name: Routes.ABOUT,
      page: () => const AboutScreen(),
    ),
  ];
}

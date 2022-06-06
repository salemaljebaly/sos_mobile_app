import 'package:get/get.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/view/home_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(title: Strings.appName),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => HomeScreen(title: Strings.appName),
    ),
    GetPage(
      name: Routes.REPORT,
      page: () => HomeScreen(title: Strings.appName),
    ),
    GetPage(
      name: Routes.POLICE_OFFICES,
      page: () => HomeScreen(title: Strings.appName),
    ),
    GetPage(
      name: Routes.ABOUT,
      page: () => HomeScreen(title: Strings.appName),
    ),
  ];
}

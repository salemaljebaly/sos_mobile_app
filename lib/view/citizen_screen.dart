import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos_mobile_app/controller/auth_contoller.dart';
import 'package:sos_mobile_app/model/citizen_request_model.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/utils/widgets/app_logo.dart';
import 'package:sos_mobile_app/utils/widgets/drawer.dart';
import 'package:sos_mobile_app/view/current_location_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class CitizenScreen extends StatelessWidget {
  CitizenScreen({Key? key}) : super(key: key);
  final box = GetStorage();
  final AuthController _authController = Get.put(AuthController());

  // ------------------------------------------------------------------------ //
  TextEditingController firstName = TextEditingController();

  TextEditingController lastName = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController phone = TextEditingController();
  late CitizenRequestModel citizenRequestModel;
  // ------------------------------------------------------------------------ //
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(Strings.appName),
      ),
      body: Obx(
        () => PageView(
          controller: _pageController,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const AppLogo(
                      mainTitle: 'معلومات المستخدم',
                      subTitle: '-----------------------------',
                      logo: 'assets/icons/logo.png'),
                  ListTile(
                    leading: const Icon(Icons.person_rounded),
                    title: Text(
                        '${Strings.fullName} ${_authController.firstName} ${_authController.lastName}'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email_rounded),
                    title: Text('${Strings.email} ${_authController.email}'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.mobile_screen_share_sharp),
                    title: Text('${Strings.phone} ${_authController.phone}'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_city),
                    title: Text('${Strings.city} ${_authController.city}'),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                    title: Text('${Strings.location} '),
                    trailing:
                        Image.asset('assets/icons/googlemaps.png', scale: 2),
                    onTap: () async {
                      _launchUrl();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 58.0,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1.0, color: Colors.red),
                        ),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.red,
                        ),
                        label: Text(
                          Strings.edit,
                          style: const TextStyle(color: Colors.red),
                        ),
                        onPressed: (() => {
                              _pageController.animateToPage(2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.bounceIn)
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  AppLogo(
                      mainTitle: Strings.editCitizen,
                      subTitle: '',
                      logo: 'assets/icons/logo.png'),
                  Padding(
                      child: registerForm(context),
                      padding: const EdgeInsets.all(4.0)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _launchUrl() async {
    final Uri _url = Uri.parse(
        'https://maps.google.com/?q=${_authController.latitude}, ${_authController.longitude}');
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  // ---------------------------------------------------------------------------------- //
  // ------------------------------------------------------------------------------- //
  // login form
  Form registerForm(BuildContext context) {
    firstName.text = _authController.firstName.toString();
    lastName.text = _authController.lastName.toString();
    email.text = _authController.email.toString();
    city.text = _authController.city.toString();
    phone.text = _authController.phone.toString();
    firstName.text = _authController.firstName.toString();
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: firstName,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? Strings.emptyUsername
                      : null;
                },
                decoration: InputDecoration(
                  label: Text(Strings.firstName),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextFormField(
                controller: lastName,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? Strings.emptyUsername
                      : null;
                },
                decoration: InputDecoration(
                  label: Text(Strings.lastName),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: email,
          validator: (value) {
            return (value == null || !value.isEmail)
                ? Strings.mustBeEmail
                : null;
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            label: Text(Strings.email),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: phone,
          validator: (value) {
            return (value == null || !value.isPhoneNumber)
                ? Strings.mustBePhone
                : null;
          },
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            label: Text(Strings.phone),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: city,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? Strings.emptyUsername
                : null;
          },
          decoration: InputDecoration(
            label: Text(Strings.city),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: TextFormField(
                controller: password,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? Strings.emptyUsername
                      : null;
                },
                decoration: InputDecoration(
                  label: Text(Strings.password),
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
                icon: Icon(Icons.location_on_sharp),
                label: Text('الموقع'),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            width: double.infinity,
            height: 58.5,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1.0, color: Colors.red),
              ),
              onPressed: () async {
                citizenRequestModel = CitizenRequestModel(
                    firstName: firstName.text,
                    lastName: lastName.text,
                    username: _authController.username.toString(),
                    email: email.text,
                    phone: '+218' + phone.text,
                    password: password.text,
                    isActive: false,
                    city: city.text,
                    longitude:
                        _authController.citizenLongitude.value.toString(),
                    latitude: _authController.citizenLatitude.value.toString());
                await _authController.updateOne(citizenRequestModel);
              },
              child: Text(
                Strings.save,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
        ),
      ]),
    );
  }
  // ----------------------------------------------------------------------------------- //
}

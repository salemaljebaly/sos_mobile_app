import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile_app/controller/auth_contoller.dart';
import 'package:sos_mobile_app/controller/auth_manager.dart';
import 'package:sos_mobile_app/model/citizen_request_model.dart';
import 'package:sos_mobile_app/utils/strings.dart';
import 'package:sos_mobile_app/utils/widgets/app_logo.dart';
import 'package:sos_mobile_app/view/citizen_screen.dart';
import 'package:sos_mobile_app/view/current_location_screen.dart';
import 'package:sos_mobile_app/view/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final AuthController _authController = Get.put(AuthController());
  final AuthManager _authManager = Get.find();
  // ------------------------------------------------------------------------ //
  // edit
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
  FormType _formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _formType == FormType.login
            ? Text(Strings.login)
            : Text(Strings.register),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TODO need to fix
            AppLogo(
                mainTitle: Strings.appName,
                subTitle: '----------',
                logo: 'assets/icons/logo.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _formType == FormType.login ? loginForm() : registerForm(),
            ),
          ],
        ),
      ),
    );
  }

// ------------------------------------------------------------------------------- //
// login form
  Form loginForm() {
    return Form(
      // use validate when user interact
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: usernameController,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? Strings.emptyUsername
                : null;
          },
          decoration: InputDecoration(
            label: Text(Strings.username),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty)
                ? Strings.emptyPassword
                : null;
          },
          controller: passwordController,
          decoration: InputDecoration(
            label: Text(Strings.password),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              if (formKey.currentState?.validate() ?? false) {
                await _authController.loginUser(
                    usernameController.text, passwordController.text);
              }
              // Obx(() {
              //   _authManager.isLogin.value
              //     ? Get.to(() => HomeScreen(
              //           title: Strings.appName,
              //         ))
              //     : null;
              // }),
            },
            child: Text(Strings.login),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _formType = FormType.register;
            });
          },
          child: Text(Strings.dontHaveAccount),
        )
      ]),
    );
  }

  Widget myStepper() {
    int currentStep = 0;
    return Stepper(
      type: StepperType.horizontal,
      currentStep: currentStep,
      onStepTapped: (index) {
        setState(() {
          currentStep = index;
        });
      },
      steps: [
        Step(
          isActive: currentStep >= 0,
          title: Text(Strings.generalInfo),
          content: registerForm(),
        ),
        Step(
          isActive: currentStep >= 1,
          title: Text(Strings.generalInfo),
          content: Text('map'),
        ),
      ],
    );
  }

  // ------------------------------------------------------------------------------- //
  // login form
  Form registerForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
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
        TextFormField(
          controller: username,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? Strings.emptyUsername
                : null;
          },
          decoration: InputDecoration(
            label: Text(Strings.username),
          ),
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
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              citizenRequestModel = CitizenRequestModel(
                  firstName: firstName.text,
                  lastName: lastName.text,
                  username: username.text,
                  email: email.text,
                  phone: '+218' + phone.text,
                  password: password.text,
                  isActive: false,
                  city: city.text,
                  longitude: _authController.citizenLongitude.value.toString(),
                  latitude: _authController.citizenLatitude.value.toString());
              if (formKey.currentState?.validate() ?? false) {
                await _authController.createCitizen(citizenRequestModel);
              }

              _authController.isCitizenCreated.value
                  ? setState(() {
                      _formType = FormType.login;
                    })
                  : null;
            },
            child: Text(Strings.register),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _formType = FormType.login;
            });
          },
          child: Text(Strings.login),
        )
      ]),
    );
  }
}

enum FormType { login, register }

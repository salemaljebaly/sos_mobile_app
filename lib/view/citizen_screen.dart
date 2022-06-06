import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos_mobile_app/controller/cache_token.dart';
import 'package:sos_mobile_app/utils/strings.dart';

class CitizenScreen extends StatelessWidget {
  CitizenScreen({Key? key}) : super(key: key);
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.appName),
        ),
        body: Center(child: Text(box.read(CacheTokenKey.token.toString()))));
  }
}

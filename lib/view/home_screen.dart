import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // Obx(
        //   () => Text("Clicks: ${myController.count}"),
        // ),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Other"),
          onPressed: () => Get.to(
            () => Other(),
          ),
        ),
      ),
    );
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("test")));
  }
}

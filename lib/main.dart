import 'package:control/Iot.dart';
import 'package:control/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/view.dart';
void main() {
  Iot().connect();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.log("build MyApp");
    return GetMaterialApp(
      title: 'Iot Control',
      theme: ThemeData(

        useMaterial3: true,
      ),
      initialRoute: AppPages.INITIAL,
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
    );
  }
}

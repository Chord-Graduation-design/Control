import 'package:control/Iot.dart';
import 'package:control/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
        brightness: Brightness.light,
        primaryColor: const Color(0xff2e133a),
        scaffoldBackgroundColor: Colors.white,
        primaryColorLight: const Color(0xff86003c),
        primaryColorDark:  const Color(0xff442b2b),
        colorScheme:  ColorScheme.light(
          primary: const Color(0xff2e133a),
          secondary:const Color(0xff2e133a).withOpacity(0.3)
        ),
        useMaterial3: true,
      ),
      initialRoute: AppPages.INITIAL,
      // defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:control/pages/main/view.dart';
import 'package:get/get.dart';
import 'package:control/pages/camera/view.dart';

class AppPages{
  static const INITIAL = MAIN;
  static const CAMERA = '/camera';
  static const MAIN = '/';
  static final routes = [
    GetPage(name: AppPages.MAIN, page: () => MainPage()),
    GetPage(name: AppPages.CAMERA, page: () => CameraPage()),
  ];
}
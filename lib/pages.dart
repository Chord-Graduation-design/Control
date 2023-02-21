import 'package:control/home/view.dart';
import 'package:get/get.dart';
class AppPages{
  static const INITIAL = AppPages.HOME;
  static const HOME = '/home';
  static final routes = [
    GetPage(name: AppPages.HOME, page: () => HomePage()),
  ];
}
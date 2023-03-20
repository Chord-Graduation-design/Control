import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLogic extends GetxController {
  final _index = 0.obs;
  final pageController = PageController().obs;
  set index(int value) => _index.value = value;
  int get index => _index.value;

}

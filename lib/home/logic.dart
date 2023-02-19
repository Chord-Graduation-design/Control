import 'dart:convert';

import 'package:control/Iot.dart';
import 'package:get/get.dart';
class HomeLogic extends GetxController {
  var temp = 0.0.obs;
  var hum = 0.0.obs;
  @override
  void onInit() {
    super.onInit();
    Iot().subscribe("esp32/aht10");
    Iot().addUpdateCallBack("esp32/aht10", (msg) {
      try {
        final aht10 = json.decode(msg);
        temp.value = aht10["temp"];
        hum.value = aht10["hum"];
      } catch (e) {
        Get.log(e.toString());
      }
    });
  }
}

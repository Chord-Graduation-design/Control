import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:esp_smartconfig/esp_smartconfig.dart';
import 'package:network_info_plus/network_info_plus.dart';
class SmartConfigLogic extends GetxController {
  var ssid_controller = Rx<TextEditingController>(TextEditingController());
  var pwd_controller = Rx<TextEditingController>(TextEditingController());
   Future< void> startSmartConfig() async {
    Get.log("startSmartConfig");
    late var networkInfo = NetworkInfo();
    var bssid = await networkInfo.getWifiBSSID();
    late var config = ProvisioningRequest.fromStrings(
      ssid: ssid_controller.value.text,
      password: pwd_controller.value.text,
      bssid: bssid!,
    );
    await Provisioner.espTouch().start(config);
  }
}

import 'dart:async';

import 'package:control/Iot.dart';
import 'package:get/get.dart';
import 'package:control/protos/msg.pb.dart';
class HomeLogic extends SuperController  {
  var temp = 0.0.obs;
  var hum = 0.0.obs;
  var led_switch = false.obs;
  var servo_angle = 0.obs;
  // late final Timer timer;
  // void temp_hum_get(Timer timer) async{
  //   //发送获取温湿度信息
  //   SensorIn msg = SensorIn()..type = SensorType.TEMPERATURE_AND_HUMIDITY;
  //   await Iot().publish(Iot.InTopic, msg.writeToBuffer());
  // }
  @override
  void onInit() {
    super.onInit();
    Iot().subscribe("esp32/aht10");
    Iot().subscribe("esp32/led");
    Iot().subscribe("esp32/servo");
    Iot().addUpdateCallBack("esp32/aht10", (msg) {
      try {
        TemperatureAndHumidity x = TemperatureAndHumidity.fromBuffer(msg);
        temp.value = x.temperature;
        hum.value = x.humidity;
      } catch (e) {
        Get.log("esp32/aht10 ${e.toString()}");
      }
    });
    Iot().addUpdateCallBack("esp32/led", (msg) {
      try{
        late var x = LedSwitch.fromBuffer(msg);
        led_switch.value = x.on;
      }catch(e){
        Get.log("esp32/led ${e.toString()}");
      }
    });
    Iot().addUpdateCallBack("esp32/servo", (msg) {
      try{
        late var x = ServoAngle.fromBuffer(msg);
        servo_angle.value = x.angle;
        Get.log("esp32/servo ${x.angle}");
      }catch(e)
      {
        Get.log("esp32/servo ${e.toString()}");
      }
    });
    // timer = Timer.periodic(const Duration(seconds: 1), temp_hum_get);
    //通知傻逼单片机,我tm来了 give me 信息
    SensorIn msg = SensorIn()..type = SensorType.IN_CONTROL;
    Iot().publish(Iot.InTopic,msg.writeToBuffer());
  }
  @override
  void onClose(){
    Get.log("onClose");
    // timer.cancel();
    super.onClose();
  }


  @override
  void onDetached() {
    Get.log("onDetached");
  }

  @override
  void onInactive() {
    Get.log("onInactive");
  }

  @override
  void onPaused() {
    Get.log("onPaused");
    //页面切换到后台,停止定时器
    // timer.cancel();
  }

  @override
  void onResumed() {
    Get.log("onResumed");
  }

}

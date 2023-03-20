import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:control/Iot.dart';
import 'package:control/protos/msg.pb.dart';
import 'package:control/pages/pages.dart';
import 'home_widget.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.067),
        height: size.height,
        width: size.width,
        color: Theme.of(context).scaffoldBackgroundColor,
        child:Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: size.height * 0.08),
            //标题
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '欢迎,来到\n你的家, Chord',
                  style:CtrlFonts.SmileySansTextStyle
                    .copyWith(color: Theme.of(context).primaryColorDark),
                ),
                GestureDetector(
                  child: CircleAvatar(
                    radius: size.width * 0.075,
                    backgroundImage: const AssetImage("assets/images/user.webp"),
                    // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                )
              ],
            ),
            Expanded(
                child: SizedBox(
                  width: size.width * 0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.03),
                        SizedBox(
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TempHumidBanner(
                                img: 'assets/icons/temperature.png',
                                title: 'Temperature',
                                horizontalPadding: size.width * 0.046,
                                child: Obx(() => Text(
                                  '${logic.temp.value.toStringAsFixed(1)}°C',
                                  style: CtrlFonts.kSub2HeadTextStyle.copyWith(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                  ),
                                )),
                                ),
                              TempHumidBanner(
                                img: 'assets/icons/humidity.png',
                                title: 'Humidity',
                                horizontalPadding: size.width * 0.044,
                                child: Obx(() => Text(
                                  '${logic.hum.value.toStringAsFixed(1)}%',
                                  style: CtrlFonts.kSub2HeadTextStyle.copyWith(
                                    color: Theme.of(context).primaryColorDark,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Text(
                            "控制",
                          style: CtrlFonts.SmileySansTextStyle.copyWith(
                              color: Theme.of(context).primaryColorDark,
                              fontSize: 18,
                              fontWeight: FontWeight.w400
                            ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SmartSystem(
                                  color: const Color(0xffE9D7FF),
                                  title: 'LED 开关',
                                  imageUrl: 'assets/images/icons8-light-96.png',
                                  onTap: () {},
                                  child: Switch(
                                    value:true,
                                    onChanged: (value) {
                                      Get.log("LED Switch");
                                    },
                                  ),
                                ),
                                SmartSystem(
                                  color: const Color(0xffD9EEFF),
                                  title: '窗开关',
                                  imageUrl:
                                  'assets/images/icons8-rgb-lamp-96.png',
                                  onTap: () => Get.dialog(
                                    AlertDialog(
                                      title: const Center(
                                          child:Text(
                                            '窗控制',
                                            style: TextStyle(
                                              fontFamily: 'SmileySans',
                                              fontWeight: FontWeight.w100,
                                            ),
                                          )
                                      ),
                                      content: Obx(()=>Slider(
                                        value: logic.servo_angle.value.toDouble(),
                                        min: 0,
                                        max: 360,
                                        divisions: 360,
                                        label: logic.servo_angle.value.toString(),
                                        onChanged: (value) {
                                          logic.servo_angle.value = value.toInt();
                                        },
                                      )),
                                      actions: [
                                        Center(
                                            child: ElevatedButton  (
                                              onPressed: () => Get.back(),
                                              child: const Text('确定'),
                                          )
                                        ),
                                      ],
                                    ),
                                  ),
                                  child: Obx(()=>Switch(
                                    value:logic.servo_angle.value > 200,
                                    onChanged: (value) {
                                      SensorIn msg = SensorIn()..type = SensorType.SERVO;
                                      if(value) {
                                        msg.tick = 180;
                                      } else {
                                        msg.tick = 0;
                                      }
                                      Iot().publish(Iot.InTopic,msg.writeToBuffer());
                                    },
                                  )),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SmartSystem(
                                  color: const Color(0xffFFE28B),
                                  title: 'LED 开关',
                                  imageUrl: 'assets/images/icons8-music-record-96.png',
                                  onTap: () {},
                                  child: Obx(()=>Switch(
                                    value:logic.led_switch.value,
                                    onChanged: (value){
                                      SensorIn msg = SensorIn()..type = SensorType.LED_SWITCH;
                                      Iot().publish(Iot.InTopic,msg.writeToBuffer());
                                    },

                                  )),
                                ),
                                SmartSystem(
                                  color: const Color(0xffFFD9D3),
                                  title: '摄像头',
                                  imageUrl:
                                  'assets/images/icons8-music-record-96.png',
                                  onTap: () {
                                    Get.toNamed(AppPages.CAMERA);
                                  },
                                
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
            ),
          ],
        ),
      );
  }
}

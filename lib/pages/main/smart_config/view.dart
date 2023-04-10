import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'logic.dart';

class SmartConfigPage extends StatelessWidget {
  final logic = Get.put(SmartConfigLogic());

  @override
  Widget build(BuildContext context) {
    return Container (
      padding: const EdgeInsets.symmetric(horizontal: 20),
        child:Column(
        // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            //标题
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'SmartConfig ,\n设备配网',
                  style:const TextStyle(
                      fontFamily: "SmileySans",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ).copyWith(color: Theme.of(context).primaryColorDark),
                ),
                GestureDetector(
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/user.webp"),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            //输入框
             Obx(()=>TextField(
                decoration: InputDecoration(
                  hintText: 'wifi名称',
                  hintStyle: const TextStyle(
                    color: Color(0xffb3b3b3),
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(Icons.wifi),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  filled: true,
                  fillColor: const Color(0xfff5f5f5),
                  suffixIcon:IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () async {
                        // logic.ssid_controller.value.text = '123';
                        late var networkInfo = NetworkInfo();
                        var wifiName = await networkInfo.getWifiName();
                        wifiName = wifiName!.replaceAll(RegExp(r'\"'), '');
                        logic.ssid_controller.value.text = wifiName!;
                      },
                  )
              ),
              controller: logic.ssid_controller.value,
            )),
            const SizedBox(height: 10),
            Obx(()=>TextField(
              decoration: const InputDecoration(
                hintText: 'wifi密码',
                hintStyle: TextStyle(
                  color: Color(0xffb3b3b3),
                  fontSize: 14,
                ),
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                filled: true,
                fillColor: Color(0xfff5f5f5),
              ),
              controller: logic.pwd_controller.value,
            )),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  
                  await logic.startSmartConfig();
                  Get.dialog(
                    const AlertDialog(
                      title: Center(
                          child:Text('等待配网成功!',
                            style: TextStyle(
                              fontFamily: "SmileySans",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                            ),
                      )),
                      content: //CircularProgressIndicator
                      SizedBox(
                          width: 50,
                          height: 50,
                          child:Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                strokeWidth: 5,
                              ),
                            ),
                          )
                    ))
                  );
                  Get.log("配网成功");
                },
                child: const Text('开始配网'),
              ),
            ),
        ],
      )
    );
  }
}

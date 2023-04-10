import 'package:control/pages/main/home/view.dart';
import 'package:control/pages/main/setting/view.dart';
import 'package:control/pages/main/smart_config/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'logic.dart';

class MainPage extends StatelessWidget {
  final logic = Get.put(MainLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => PageView(
        controller: logic.pageController.value,
        onPageChanged: (index) => logic.index = index,
        children: [
          HomePage(),
          SmartConfigPage(),
          SettingPage(),
          Container(color: Colors.blue),
        ],
      )),
      bottomNavigationBar:Obx(()=>SalomonBottomBar(
        currentIndex:  logic.index,
        onTap: (index) {
          logic.index = index;
          logic.pageController.value.animateToPage(index,
              duration: const Duration(milliseconds: 16), curve: Curves.fastOutSlowIn);
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text(
                "主页 ",
                style: TextStyle(
                  fontFamily: "SmileySans",
                  fontWeight: FontWeight.w500,
                ),
            ),
            selectedColor: Colors.purple,
          ),

          /// 配网
          SalomonBottomBarItem(
            icon: const Icon(Icons.wifi),
            title: const Text(
              "配网 ",
              style: TextStyle(
                fontFamily: "SmileySans",
                fontWeight: FontWeight.w500,
              ),
            ),
            selectedColor: Colors.pink,
          ),

          //设置
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text("设置 ",
              style: TextStyle(
                fontFamily: "SmileySans",
                fontWeight: FontWeight.w500,
              )
            ),
            selectedColor: Colors.teal,
          ),

          //个人中心
          SalomonBottomBarItem(
            icon: const Icon(Icons.person_outline),
            title: const Text(
                "个人中心",
              style:TextStyle(
              fontFamily: "SmileySans",
              fontWeight: FontWeight.w500,
            )),
            selectedColor: Colors.orange,
          ),
        ],
      ),
    ));
  }
}

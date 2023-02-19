import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //背景渐变
      body: Container(
        width: double.infinity,
        height:  double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFfce2e1), Colors.white]),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: SafeArea(
            child: Column(
              children: [
                //标题
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Hi. 叼毛",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    CircleAvatar(
                      minRadius: 16,
                      backgroundImage: AssetImage("assets/images/user.webp"),
                    )
                  ]
                ),
                const SizedBox(
                  height: 10,
                ),
                Temperature(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: (){

                        },
                        child: Text('sb')),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Temperature(){
    return Stack(
        children:[
          Image.asset("assets/images/Sunny.webp"),
          Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Obx(() => Text((logic.temp.value).toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          height: 0,
                          fontWeight: FontWeight.bold))),
                  const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text("°C",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              height: 0,
                              fontWeight: FontWeight.bold))
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 60,
                  ),
                  const Text("温度  |  湿度",
                      style: TextStyle(
                          height: 0,
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w100)),
                  const SizedBox(width: 20),
                  Obx(() => Text((logic.hum.value).toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          height: 0,
                          fontWeight: FontWeight.w200))),
                  const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text("%",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              height: 0,
                              fontWeight: FontWeight.w300))
                  ),
                ],

              ),
              const Center(
                child:Text(
                    "Temperature |  Humidity",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w100)
                ),
              )
            ],
          )
        ]
    );
  }

}

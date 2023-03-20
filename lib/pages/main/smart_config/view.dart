import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            const SizedBox(height: 30),
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




        ],
      )
    );
  }
}

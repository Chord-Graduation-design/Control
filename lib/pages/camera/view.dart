import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';
// import 'package:yolo/yolo.dart';
class CameraPage extends StatelessWidget {
  final logic = Get.put(CameraLogic());

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Obx(() {
      return logic.controller.value != null && logic.controller.value!.value.isInitialized ?
      Scaffold(
        appBar: AppBar(
          title: const Text('目标识别'),
        ),
        body: Stack(
          children: [
            SizedBox( width:double.infinity, height: double.infinity,
              child: AspectRatio(
                aspectRatio: logic.controller.value!.value.aspectRatio,
                child: CameraPreview(
                  logic.controller.value!,
                ),
              ),
            ),

          ],
        ),
      ) :
      Container(
          color: Colors.white,
          child:const Center(child: CircularProgressIndicator())
        );
    });

  }
}
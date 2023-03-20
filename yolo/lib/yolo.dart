import 'yolo_platform_interface.dart';
import 'dart:ffi';
import 'dart:io';


final DynamicLibrary nativeLib = Platform.isAndroid
    ? DynamicLibrary.open("libyolo.so")
    : DynamicLibrary.process();
class IMG extends Struct{
  @Uint8()
  external int width;
  @Uint8()
  external int height;
  @Uint8()
  external int channel;
  @Uint8()
  external int data;
}
class Yolo {

  Future<String?> getPlatformVersion() {
    return YoloPlatform.instance.getPlatformVersion();
  }

}

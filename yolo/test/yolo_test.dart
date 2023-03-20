import 'package:flutter_test/flutter_test.dart';
import 'package:yolo/yolo.dart';
import 'package:yolo/yolo_platform_interface.dart';
import 'package:yolo/yolo_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockYoloPlatform
    with MockPlatformInterfaceMixin
    implements YoloPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final YoloPlatform initialPlatform = YoloPlatform.instance;

  test('$MethodChannelYolo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelYolo>());
  });

  test('getPlatformVersion', () async {
    Yolo yoloPlugin = Yolo();
    MockYoloPlatform fakePlatform = MockYoloPlatform();
    YoloPlatform.instance = fakePlatform;

    expect(await yoloPlugin.getPlatformVersion(), '42');
  });
}

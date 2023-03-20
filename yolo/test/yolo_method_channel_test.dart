import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yolo/yolo_method_channel.dart';

void main() {
  MethodChannelYolo platform = MethodChannelYolo();
  const MethodChannel channel = MethodChannel('yolo');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}

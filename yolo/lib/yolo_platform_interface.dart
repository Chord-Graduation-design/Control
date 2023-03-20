import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'yolo_method_channel.dart';

abstract class YoloPlatform extends PlatformInterface {
  /// Constructs a YoloPlatform.
  YoloPlatform() : super(token: _token);

  static final Object _token = Object();

  static YoloPlatform _instance = MethodChannelYolo();

  /// The default instance of [YoloPlatform] to use.
  ///
  /// Defaults to [MethodChannelYolo].
  static YoloPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [YoloPlatform] when
  /// they register themselves.
  static set instance(YoloPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

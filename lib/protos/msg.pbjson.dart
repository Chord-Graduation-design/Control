///
//  Generated code. Do not modify.
//  source: msg.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use sensorTypeDescriptor instead')
const SensorType$json = const {
  '1': 'SensorType',
  '2': const [
    const {'1': 'None', '2': 0},
    const {'1': 'IN_CONTROL', '2': 1},
    const {'1': 'SET_HUM_TEMP_TICK', '2': 2},
    const {'1': 'LED_SWITCH', '2': 3},
    const {'1': 'SERVO', '2': 4},
    const {'1': 'BEEP', '2': 6},
  ],
};

/// Descriptor for `SensorType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sensorTypeDescriptor = $convert.base64Decode('CgpTZW5zb3JUeXBlEggKBE5vbmUQABIOCgpJTl9DT05UUk9MEAESFQoRU0VUX0hVTV9URU1QX1RJQ0sQAhIOCgpMRURfU1dJVENIEAMSCQoFU0VSVk8QBBIICgRCRUVQEAY=');
@$core.Deprecated('Use temperatureAndHumidityDescriptor instead')
const TemperatureAndHumidity$json = const {
  '1': 'TemperatureAndHumidity',
  '2': const [
    const {'1': 'temperature', '3': 1, '4': 1, '5': 2, '10': 'temperature'},
    const {'1': 'humidity', '3': 2, '4': 1, '5': 2, '10': 'humidity'},
  ],
};

/// Descriptor for `TemperatureAndHumidity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List temperatureAndHumidityDescriptor = $convert.base64Decode('ChZUZW1wZXJhdHVyZUFuZEh1bWlkaXR5EiAKC3RlbXBlcmF0dXJlGAEgASgCUgt0ZW1wZXJhdHVyZRIaCghodW1pZGl0eRgCIAEoAlIIaHVtaWRpdHk=');
@$core.Deprecated('Use ledSwitchDescriptor instead')
const LedSwitch$json = const {
  '1': 'LedSwitch',
  '2': const [
    const {'1': 'on', '3': 1, '4': 1, '5': 8, '10': 'on'},
  ],
};

/// Descriptor for `LedSwitch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ledSwitchDescriptor = $convert.base64Decode('CglMZWRTd2l0Y2gSDgoCb24YASABKAhSAm9u');
@$core.Deprecated('Use servoAngleDescriptor instead')
const ServoAngle$json = const {
  '1': 'ServoAngle',
  '2': const [
    const {'1': 'angle', '3': 1, '4': 1, '5': 5, '10': 'angle'},
  ],
};

/// Descriptor for `ServoAngle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List servoAngleDescriptor = $convert.base64Decode('CgpTZXJ2b0FuZ2xlEhQKBWFuZ2xlGAEgASgFUgVhbmdsZQ==');
@$core.Deprecated('Use sensorInDescriptor instead')
const SensorIn$json = const {
  '1': 'SensorIn',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.SensorType', '10': 'type'},
    const {'1': 'tick', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'tick', '17': true},
  ],
  '8': const [
    const {'1': '_tick'},
  ],
};

/// Descriptor for `SensorIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sensorInDescriptor = $convert.base64Decode('CghTZW5zb3JJbhIfCgR0eXBlGAEgASgOMgsuU2Vuc29yVHlwZVIEdHlwZRIXCgR0aWNrGAIgASgFSABSBHRpY2uIAQFCBwoFX3RpY2s=');

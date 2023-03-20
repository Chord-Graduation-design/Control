///
//  Generated code. Do not modify.
//  source: msg.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class SensorType extends $pb.ProtobufEnum {
  static const SensorType None = SensorType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'None');
  static const SensorType IN_CONTROL = SensorType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IN_CONTROL');
  static const SensorType SET_HUM_TEMP_TICK = SensorType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SET_HUM_TEMP_TICK');
  static const SensorType LED_SWITCH = SensorType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LED_SWITCH');
  static const SensorType SERVO = SensorType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SERVO');
  static const SensorType BEEP = SensorType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BEEP');

  static const $core.List<SensorType> values = <SensorType> [
    None,
    IN_CONTROL,
    SET_HUM_TEMP_TICK,
    LED_SWITCH,
    SERVO,
    BEEP,
  ];

  static final $core.Map<$core.int, SensorType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SensorType? valueOf($core.int value) => _byValue[value];

  const SensorType._($core.int v, $core.String n) : super(v, n);
}


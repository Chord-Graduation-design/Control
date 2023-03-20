///
//  Generated code. Do not modify.
//  source: msg.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'msg.pbenum.dart';

export 'msg.pbenum.dart';

class TemperatureAndHumidity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TemperatureAndHumidity', createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'temperature', $pb.PbFieldType.OF)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'humidity', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  TemperatureAndHumidity._() : super();
  factory TemperatureAndHumidity({
    $core.double? temperature,
    $core.double? humidity,
  }) {
    final _result = create();
    if (temperature != null) {
      _result.temperature = temperature;
    }
    if (humidity != null) {
      _result.humidity = humidity;
    }
    return _result;
  }
  factory TemperatureAndHumidity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TemperatureAndHumidity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TemperatureAndHumidity clone() => TemperatureAndHumidity()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TemperatureAndHumidity copyWith(void Function(TemperatureAndHumidity) updates) => super.copyWith((message) => updates(message as TemperatureAndHumidity)) as TemperatureAndHumidity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TemperatureAndHumidity create() => TemperatureAndHumidity._();
  TemperatureAndHumidity createEmptyInstance() => create();
  static $pb.PbList<TemperatureAndHumidity> createRepeated() => $pb.PbList<TemperatureAndHumidity>();
  @$core.pragma('dart2js:noInline')
  static TemperatureAndHumidity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TemperatureAndHumidity>(create);
  static TemperatureAndHumidity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get temperature => $_getN(0);
  @$pb.TagNumber(1)
  set temperature($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTemperature() => $_has(0);
  @$pb.TagNumber(1)
  void clearTemperature() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get humidity => $_getN(1);
  @$pb.TagNumber(2)
  set humidity($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHumidity() => $_has(1);
  @$pb.TagNumber(2)
  void clearHumidity() => clearField(2);
}

class LedSwitch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LedSwitch', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'on')
    ..hasRequiredFields = false
  ;

  LedSwitch._() : super();
  factory LedSwitch({
    $core.bool? on,
  }) {
    final _result = create();
    if (on != null) {
      _result.on = on;
    }
    return _result;
  }
  factory LedSwitch.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LedSwitch.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LedSwitch clone() => LedSwitch()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LedSwitch copyWith(void Function(LedSwitch) updates) => super.copyWith((message) => updates(message as LedSwitch)) as LedSwitch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LedSwitch create() => LedSwitch._();
  LedSwitch createEmptyInstance() => create();
  static $pb.PbList<LedSwitch> createRepeated() => $pb.PbList<LedSwitch>();
  @$core.pragma('dart2js:noInline')
  static LedSwitch getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LedSwitch>(create);
  static LedSwitch? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get on => $_getBF(0);
  @$pb.TagNumber(1)
  set on($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearOn() => clearField(1);
}

class ServoAngle extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServoAngle', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'angle', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ServoAngle._() : super();
  factory ServoAngle({
    $core.int? angle,
  }) {
    final _result = create();
    if (angle != null) {
      _result.angle = angle;
    }
    return _result;
  }
  factory ServoAngle.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServoAngle.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServoAngle clone() => ServoAngle()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServoAngle copyWith(void Function(ServoAngle) updates) => super.copyWith((message) => updates(message as ServoAngle)) as ServoAngle; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServoAngle create() => ServoAngle._();
  ServoAngle createEmptyInstance() => create();
  static $pb.PbList<ServoAngle> createRepeated() => $pb.PbList<ServoAngle>();
  @$core.pragma('dart2js:noInline')
  static ServoAngle getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServoAngle>(create);
  static ServoAngle? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get angle => $_getIZ(0);
  @$pb.TagNumber(1)
  set angle($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAngle() => $_has(0);
  @$pb.TagNumber(1)
  void clearAngle() => clearField(1);
}

class SensorIn extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SensorIn', createEmptyInstance: create)
    ..e<SensorType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: SensorType.None, valueOf: SensorType.valueOf, enumValues: SensorType.values)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tick', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  SensorIn._() : super();
  factory SensorIn({
    SensorType? type,
    $core.int? tick,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (tick != null) {
      _result.tick = tick;
    }
    return _result;
  }
  factory SensorIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SensorIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SensorIn clone() => SensorIn()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SensorIn copyWith(void Function(SensorIn) updates) => super.copyWith((message) => updates(message as SensorIn)) as SensorIn; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SensorIn create() => SensorIn._();
  SensorIn createEmptyInstance() => create();
  static $pb.PbList<SensorIn> createRepeated() => $pb.PbList<SensorIn>();
  @$core.pragma('dart2js:noInline')
  static SensorIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SensorIn>(create);
  static SensorIn? _defaultInstance;

  @$pb.TagNumber(1)
  SensorType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(SensorType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get tick => $_getIZ(1);
  @$pb.TagNumber(2)
  set tick($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTick() => $_has(1);
  @$pb.TagNumber(2)
  void clearTick() => clearField(2);
}


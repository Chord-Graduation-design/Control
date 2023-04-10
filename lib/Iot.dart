import 'dart:math';
import 'dart:typed_data';

import 'package:control/protos/msg.pb.dart';
import 'package:get/get.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';
import 'package:typed_data/src/typed_buffer.dart';


class Iot
{
  static final Iot _iot = Iot._internal();
  static const String InTopic = "esp32/InTopic";
  Iot._internal();
  factory Iot() => _iot;

  late MqttServerClient _client;
  late Map<String,List<void Function(Uint8List)>> _update_callback_map = Map();
  Future<void> connect() async {
    Get.log("Iot connect");
    // 随机a-z A-Z 0-9字符 5位
    final rand = Random.secure();
    final values = List<int>.generate(5, (i) => rand.nextInt(33) + 89);
    //转换成字符串
    final str = String.fromCharCodes(values);
    String identifier = "app-client-$str";
    _client = MqttServerClient.withPort("47.113.151.63", identifier, 1883);
    _client.logging(on: false);
    _client.keepAlivePeriod = 60;
    _client.autoReconnect = true;
    _client.onDisconnected = _onDisconnected;
    _client.onConnected = _onConnected;
    _client.onAutoReconnect = _onAutoReconnect;
    try {
      await _client.connect();
    } catch (e) {
      Get.log("EXCEPTION::client exception - $e");
      _client.disconnect();
    }
    if (_client.connectionStatus!.state == MqttConnectionState.connected) {
      _client.updates.listen(_onUpdated);
    }
  }
  void _onConnected(){

    Get.log("Connected");
  }
  void _onDisconnected(){
    Get.log("Disconnected");
  }
  void _onAutoReconnect(){
    Get.log("AutoReconnect");
  }
  Future<void> subscribe(String topic,{MqttQos qos = MqttQos.atMostOnce}) async{
    //等待连接成功!
    while(_client.connectionStatus!.state != MqttConnectionState.connected){
      //等tm 一秒钟
      await Future.delayed(const Duration(seconds: 1));
    }
    //订阅
    _client.subscribe(topic, qos);
  }
  void _onUpdated(List<MqttReceivedMessage<MqttMessage>> c) {
    final recMess = c[0].payload as MqttPublishMessage;
    final pt = MqttUtilities.bytesToStringAsString(recMess.payload.message!);
    //判断是否拥有该topic的回调
    if(_update_callback_map.containsKey(c[0].topic)){
      //执行回调
      _update_callback_map[c[0].topic]!.forEach((element) {
        late Uint8Buffer? message = recMess.payload.message;
        element(Uint8List.view(message!.buffer,0,message!.length));
      });
    }
  }
  //添加订阅回调到列表
  void addUpdateCallBack(String topic,void Function(Uint8List) callback) {
    if(_update_callback_map.containsKey(topic)){
      _update_callback_map[topic]!.add(callback);
    }else{
      _update_callback_map[topic] = [callback];
    }
  }
  // 从不删除,所以不需要
  // void removeUpdateCallBack(String topic,void Function(String) callback) {
  //   if(_update_callback_map.containsKey(topic)){
  //     _update_callback_map[topic]!.remove(callback);
  //   }
  // }



  //发布消息
  Future<void> publish(String topic,Uint8List msg,{MqttQos qos = MqttQos.atMostOnce}) async {
    //等待连接成功!
    while(_client.connectionStatus!.state != MqttConnectionState.connected){
      //等tm 一秒钟
      await Future.delayed(const Duration(seconds: 1));
    }
    final payload = Uint8Buffer();
    payload.addAll(msg);
    _client.publishMessage(topic, qos, payload);
  }
}
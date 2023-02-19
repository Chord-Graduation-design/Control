import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';


class Iot
{
  static final Iot _iot = Iot._internal();
  Iot._internal();
  factory Iot() => _iot;

  late MqttServerClient _client;
  late Map<String,List<void Function(String)>> _update_callback_map = Map();
  Future<void> connect() async {
    Get.log("Iot connect");
    String identifier = "Esp32-Client-";
    _client = MqttServerClient.withPort("81.68.127.168", identifier, 1883);
    _client.logging(on: false);
    _client.keepAlivePeriod = 60;
    _client.autoReconnect = true;
    _client.onDisconnected = _onDisconnected;
    _client.onConnected = _onConnected;
    _client.onAutoReconnect = _onAutoReconnect;
    _client.setProtocolV311();
    try {
      await _client.connect();
    } catch (e) {
      Get.log("EXCEPTION::client exception - $e");
      _client.disconnect();
    }
    if (_client.connectionStatus!.state == MqttConnectionState.connected) {
      _client.updates!.listen(_onUpdated);
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
      await Future.delayed(Duration(seconds: 1));
    }
    //订阅
    _client.subscribe(topic, qos);
  }
  void _onUpdated(List<MqttReceivedMessage<MqttMessage>> c) {
    final recMess = c[0].payload as MqttPublishMessage;
    final pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    Get.log('topic is <${c[0].topic}>, payload is <-- $pt -->');
    Get.log(' ');
    //判断是否拥有该topic的回调
    if(_update_callback_map.containsKey(c[0].topic)){
      //执行回调
      _update_callback_map[c[0].topic]!.forEach((element) {
        element(pt);
      });
    }
  }
  //添加订阅回调到列表
  void addUpdateCallBack(String topic,void Function(String) callback) {
    if(_update_callback_map.containsKey(topic)){
      _update_callback_map[topic]!.add(callback);
    }else{
      _update_callback_map[topic] = [callback];
    }
  }
  void removeUpdateCallBack(String topic,void Function(String) callback) {
    if(_update_callback_map.containsKey(topic)){
      _update_callback_map[topic]!.remove(callback);
    }
  }
}
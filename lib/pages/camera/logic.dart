import 'package:get/get.dart';
import 'package:camera/camera.dart';
class CameraLogic extends GetxController {
  late CameraController? _controller;
  late List<CameraDescription> _cameras;
  var controller = Rx<CameraController?>(null);
  @override
  void onInit() {
    _startCamera();
    super.onInit();
  }
  _startCamera() async{
    availableCameras().then((value){
      _cameras = value;
      _controller = CameraController(
          _cameras[0],
          ResolutionPreset.medium,
          enableAudio: false
      );
      _controller!.initialize().then((value){
        _controller!.startImageStream(onLatestImageAvailable);
        controller.value = _controller;


      }).catchError((e){
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              print('User denied camera access.');
              break;
            default:
              print('Handle other errors.');
              break;
          }
        }
      });
    });


  }
  onLatestImageAvailable(CameraImage image) {
    // print("onLatestImageAvailable");

  }
  @override
  void onClose() {
    _controller!.dispose();
    super.onClose();
  }
}

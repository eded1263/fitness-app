import 'package:camera/camera.dart';

class Camera {
  late List<CameraDescription> cameras;
  late Camera handler;
  static final Camera _cameraInstance = Camera._internal();

  factory Camera() {
    return _cameraInstance;
  }

  Camera._internal();

  Future<void> loadCameras() async {
    cameras = await availableCameras();
  }
}

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class PictureTaker extends StatefulWidget {
  final Function(String path) pictureTaken;
  final CameraController controller;
  final CameraDescription currentCamera;
  final Function changeCamera;
  const PictureTaker(
      {super.key,
      required this.changeCamera,
      required this.pictureTaken,
      required this.controller,
      required this.currentCamera});

  @override
  State<PictureTaker> createState() => _PictureTakerState();
}

class _PictureTakerState extends State<PictureTaker> {
  bool _flashOn = false;

  @override
  void initState() {
    super.initState();
    if (widget.currentCamera.lensDirection == CameraLensDirection.front) {
      _flashOn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white.withOpacity(0.9)),
      width: MediaQuery.of(context).size.width * 0.65,
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: widget.currentCamera.lensDirection ==
                      CameraLensDirection.front
                  ? null
                  : () {
                      _toggleFlash();
                    },
              icon: Icon(_flashOn ? Icons.flash_off : Icons.flash_on)),
          Container(
            decoration: _cameraButtonDecoration(),
            child: IconButton(
              onPressed: () {
                _takePicture(context);
              },
              icon: const Icon(Icons.camera_alt),
            ),
          ),
          IconButton(
              onPressed: () {
                widget.changeCamera();
              },
              icon: const Icon(Icons.flip_camera_ios_outlined)),
        ],
      ),
    );
  }

  _toggleFlash() {
    if (_flashOn) {
      setState(() => _flashOn = false);
    } else {
      setState(() => _flashOn = true);
    }
  }

  _takePicture(BuildContext context) async {
    if (widget.currentCamera.lensDirection != CameraLensDirection.front &&
        _flashOn) {
      widget.controller.setFlashMode(FlashMode.torch);
    } else {
      widget.controller.setFlashMode(FlashMode.off);
    }
    final dir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
    const name = "img_pfp.png";
    final fullPath = path.join(dir!.path, name);
    final image = await widget.controller.takePicture();

    await image.saveTo(fullPath);

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Picture taken!"),
      duration: Duration(milliseconds: 600),
    ));
    widget.pictureTaken(fullPath);

    if (_flashOn) {
      widget.controller.setFlashMode(FlashMode.off);
    }
  }

  _cameraButtonDecoration() {
    return BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: [
            Color(0xffEEA4CE),
            Color(0xffC58BF2),
          ],
        ),
        color: const Color(0xff92A3FD),
        borderRadius: BorderRadius.circular(100));
  }
}

import 'package:camera/camera.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/utils/camera.dart';
import 'package:fitness_app/widgets/picture_taker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cache/cache.dart';

class PicturePage extends StatefulWidget {
  const PicturePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  @override
  void initState() {
    super.initState();
    _cameras = Camera().cameras;
    _currentCamera ??= _cameras.first;
    _initCamera(_currentCamera!);
  }

  CameraDescription? _currentCamera;
  late final List<CameraDescription> _cameras;
  late CameraController _controller;
  int _currentIdxCamera = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AppCache>(builder: (context, cache, child) {
      return Container(
          decoration: AppStyles.containerGradientDecoration(roundBorder: false),
          child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: FutureBuilder<void>(
                future: _controller.initialize(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: CameraPreview(_controller),
                    );
                  }

                  return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    color: Colors.black,
                  );
                },
              ),
            ),
            Positioned(
                bottom: 175,
                left: 0,
                right: 0,
                child: Center(
                  child: PictureTaker(
                      changeCamera: _changeCamera,
                      controller: _controller,
                      currentCamera: _currentCamera!,
                      pictureTaken: _pictureTaken),
                )),
            Positioned(
              bottom: 0,
              child: Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25, top: 25, right: 25, bottom: 40),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: 75,
                          height: 75,
                          decoration: _getDecorationForFooterButtons(),
                          alignment: Alignment.center,
                          child: Image.asset("assets/images/pics_color.png"),
                        ),
                        Container(
                          width: 75,
                          height: 75,
                          alignment: Alignment.center,
                          decoration: _getDecorationForFooterButtons(),
                          child: Image.asset("assets/images/pics_gray_1.png"),
                        ),
                        Container(
                          width: 75,
                          height: 75,
                          alignment: Alignment.center,
                          decoration: _getDecorationForFooterButtons(),
                          child: Image.asset("assets/images/pics_gray_2.png"),
                        ),
                        Container(
                          width: 75,
                          height: 75,
                          alignment: Alignment.center,
                          decoration: _getDecorationForFooterButtons(),
                          child: Image.asset("assets/images/pics_gray_3.png"),
                        ),
                      ]),
                ),
              ),
            )
          ]));
    }));
  }

  _pictureTaken(String path) {}

  _changeCamera() async {
    if (_currentIdxCamera == 0) {
      _initCamera(_cameras[1], idx: 1);
    } else {
      _initCamera(_cameras[0], idx: 0);
    }
  }

  Future<void> _initCamera(CameraDescription description, {int idx = 0}) async {
    _controller = CameraController(description, ResolutionPreset.max);
    await _controller.initialize();
    _currentCamera = description;
    try {
      setState(() {
        _currentIdxCamera = idx;
      });
    } catch (e) {
      print(e);
    }
  }

  _getDecorationForFooterButtons() {
    return const BoxDecoration(
        color: Color(0xffF7F8F8),
        borderRadius: BorderRadius.all(Radius.circular(25)));
  }
}

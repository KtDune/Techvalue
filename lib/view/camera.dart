import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  final CameraDescription camera;
  const Camera({super.key, required this.camera});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    getCamera();
  }

  void getCamera() {
    _controller = CameraController(widget.camera, ResolutionPreset.max);

    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_controller);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsetsDirectional.only(bottom: 25.0),
            child: FloatingActionButton(
              backgroundColor: Colors.grey,
              onPressed: (() {}),
              child: const Icon(Icons.camera_alt),
            ),
          )),
    ]);
  }
}

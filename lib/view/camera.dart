import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/file_length.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

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
  }

  void takePhoto({required FileCountProvider fCP}) async {
    final image = await _controller.takePicture();

    final directory = await getTemporaryDirectory();
    final path = '${directory.path}/${DateTime.now()}.png';

      // Save the file to the temporary directory
    final File tempFile = File(path);
    await tempFile.writeAsBytes(await image.readAsBytes());

    fCP.updateFileCount();
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
            margin: const EdgeInsetsDirectional.only(bottom: 19.0),
            child: FloatingActionButton(
              backgroundColor: Colors.grey,
              onPressed: () {
                FileCountProvider fCP = context.read<FileCountProvider>();
                takePhoto(fCP: fCP);
              },
              child: const Icon(Icons.camera_alt),
            ),
          )),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:myapp/view/camera.dart';
import 'package:myapp/view/next_button.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  late Future<CameraDescription> _cameraFuture;

  @override
  void initState() {
    super.initState();
    _cameraFuture = _initializeCamera();
  }

  Future<CameraDescription> _initializeCamera() async {
    final cameras = await availableCameras();
    return cameras.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Images...", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 54, 55, 56),
        actions: const <Widget>[
          NextButton()
        ],
      ),
      backgroundColor: Colors.deepOrange,
      body: FutureBuilder<CameraDescription>(
        future: _cameraFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Camera(camera: snapshot.data!);
            } else {
              return const Center(child: Text('No camera found'));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


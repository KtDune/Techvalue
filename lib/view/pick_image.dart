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
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading spinner while waiting for the future to complete
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show an error message if the future completes with an error
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Only build the Camera widget if we have data
            return Camera(camera: snapshot.data!);
          } else {
            // Handle the case where snapshot has no data
            return const Center(child: Text('No camera available'));
          }
        },
      ),
    );
  }
}


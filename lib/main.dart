import 'package:flutter/material.dart';
import 'package:myapp/view/pick_image.dart';
import 'package:camera/camera.dart';
import 'package:myapp/model/camera_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(
    ChangeNotifierProvider(
      create: (_) => CameraProvider()..setCamera(firstCamera),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PickImage(),
    );
  }

}




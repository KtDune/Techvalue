import 'package:flutter/material.dart';
import 'package:myapp/view/pick_image.dart';
import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1015538657.
  runApp(const MyApp());
}

// Suggested code may be subject to a license. Learn more: ~LicenseLog:3428824773.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2762535592.
class MyApp extends StatelessWidget {

  const MyApp({super.key});
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3961586953.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1348398641.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PickImage(),
    );
  }

}




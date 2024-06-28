import 'package:flutter/material.dart';
import 'package:myapp/view/take_or_select_pic.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';

void requestPermission() async {
    // Check if the platform is not web, as web has no permissions
    if (!kIsWeb) {
      // Request storage permission
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

      // Request camera permission
      var cameraStatus = await Permission.camera.status;
      if (!cameraStatus.isGranted) {
        await Permission.camera.request();
      }
    }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

// Suggested code may be subject to a license. Learn more: ~LicenseLog:3599211299.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    requestPermission();
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2911193867.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CameraWidget(),
    );
  }
}


import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/model/file_length.dart';
import 'package:myapp/view/take_or_select_pic.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import "package:myapp/controller/delete_temp_file.dart";

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

    var microphoneStatus = await Permission.microphone.status;
    if (!microphoneStatus.isGranted) {
      await Permission.microphone.request();
    }
  }
}

void deleteFiles() async {
  try {
    final directory = await getTemporaryDirectory();
    final tempDir = Directory(directory.path);

    final List<FileSystemEntity> entities = tempDir.listSync();

    for (var entity in entities) {
      if (entity is File) {
        await entity.delete();
      }
    }

    final List<FileSystemEntity> remainingEntities = tempDir.listSync();
    if (remainingEntities.isEmpty) {
      log("File deleted");
    } else {
      log("Noe");
    }

  } catch (e) {
    throw Exception("Error in file deletion");
  }

}


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final LifecycleEventHandler lc = LifecycleEventHandler();

  @override
  void initState() {
    super.initState();
    requestPermission();
    deleteFiles();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FileCountProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CameraWidget(),
      ),
    );
  }
}


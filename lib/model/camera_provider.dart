import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraProvider extends ChangeNotifier {

  late CameraDescription _camera;

  CameraDescription getCamera() => _camera;

  void setCamera(CameraDescription camera) {
    _camera = camera;
    notifyListeners();
  }
}
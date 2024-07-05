import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileCountProvider extends ChangeNotifier {

  int fileCount;

  FileCountProvider({
    this.fileCount = 0,
});

  int get getFileCount => fileCount;

  void setFileCount({required int currentFileCount}) async {
    fileCount = currentFileCount;
    notifyListeners();
  }

  Future<void> updateFileCount() async {
    final directory = await getTemporaryDirectory();
    final tempDir = Directory(directory.path);
    final List<FileSystemEntity> entities = tempDir.listSync();
    fileCount = entities.whereType<File>().length;
    notifyListeners();
  }
}
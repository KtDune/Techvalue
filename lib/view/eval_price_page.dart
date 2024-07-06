import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  List<String> fileNameList = [];

  @override
  void initState() {
    super.initState();
    initializeList();
  }

  Future<void> initializeList() async {
    final List<String> tempFiles = await _getTempFiles();
    setState(() {
      fileNameList = tempFiles;
    });
  }

  Future<List<String>> _getTempFiles() async {
    final directory = await getTemporaryDirectory();
    final tempDir = Directory(directory.path);
    final List<FileSystemEntity> entities = tempDir.listSync();
    final List<String> filenames = [];

    for (var entity in entities) {
      if (entity is File) {
        filenames.add(entity.path.split('/').last);
      }
    }

    return filenames;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: fileNameList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: fileNameList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(fileNameList[index]),
          );
        },
      ),
    );
  }
}

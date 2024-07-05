import 'package:flutter/material.dart';
import 'package:myapp/model/file_length.dart';
import 'package:provider/provider.dart';

class NextButton extends StatefulWidget {
  const NextButton({super.key});

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blueAccent
      ),
      onPressed: onPressed, 
      child: Text("Next (${context.watch<FileCountProvider>().fileCount})")
    );
  }
}

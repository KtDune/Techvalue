
import 'package:flutter/material.dart';
import 'next_button.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {

  @override
  Widget build (BuildContext context) {
    return (
      Scaffold(
        appBar: AppBar(
          title: const Text("Add Images...", style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(255, 54, 55, 56),
          actions: const <Widget>[
            NextButton()
          ],
        ),
        backgroundColor: Colors.deepOrange,
        body: ,
      )
    );
  }
}
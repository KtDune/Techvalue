import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/model/file_length.dart';
import 'package:provider/provider.dart';
import 'package:myapp/view/eval_price_page.dart';

class NextButton extends StatefulWidget {
  const NextButton({super.key});

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  void onPressed(BuildContext context) {
    final fileCount = context.read<FileCountProvider>().fileCount;

    if (fileCount == 0) {
      Fluttertoast.showToast(
        msg: "Please take a photo",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NextPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blueAccent,
      ),
      onPressed: () => onPressed(context), // Pass the context to onPressed
      child: Text("Next (${context.watch<FileCountProvider>().fileCount})"),
    );
  }
}

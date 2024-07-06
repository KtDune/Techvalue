import 'package:flutter/material.dart';
import 'package:myapp/model/file_length.dart';
import 'package:provider/provider.dart';
import 'package:myapp/view/eval_price_page.dart'; // Import the new page

class NextButton extends StatefulWidget {
  const NextButton({super.key});

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  void onPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NextPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blueAccent,
      ),
      onPressed: onPressed,
      child: Text("Next (${context.watch<FileCountProvider>().fileCount})"),
    );
  }
}

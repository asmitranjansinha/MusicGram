import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0x00075fb0),
      body: Center(
        child: Text("Your Library is Empty!",
            style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

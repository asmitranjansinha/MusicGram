import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00075fb0),
      body: const Center(
        child: Text("Your Library is Empty!",
            style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

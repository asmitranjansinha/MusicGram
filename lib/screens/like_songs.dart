import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LikedSongs extends StatelessWidget {
  const LikedSongs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00075fb0),
      body: const Center(
          child: Text(
        "You have not added any friends yet!",
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}

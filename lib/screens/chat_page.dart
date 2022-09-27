import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff000000),
            Color(0xff343434)
        ])
      ),
      child: const Scaffold(
        backgroundColor: Color(0x00075fb0),
        body: Center(
            child: Text(
          "You have not added any friends yet!",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}

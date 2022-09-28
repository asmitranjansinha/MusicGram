import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'chat/chat_page.dart';
import 'home_page.dart';
import 'music/library_page.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  // ignore: non_constant_identifier_names
  final String name_app = "Music Gram";

  int index = 0;

  final screens = [
    const HomePage(),
    LibraryPage(),
    const ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.home,
        size: 30,
        color: Colors.teal[200],
      ),
      Icon(
        Icons.library_music_outlined,
        size: 30,
        color: Colors.teal[200],
      ),
      Icon(
        Icons.chat,
        size: 30,
        color: Colors.teal[200],
      ),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 72,
        backgroundColor: Colors.white,
        color: const Color(0xff000000),
        animationDuration: const Duration(milliseconds: 400),
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}

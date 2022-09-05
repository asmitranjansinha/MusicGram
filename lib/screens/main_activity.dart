import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'chat_page.dart';
import 'home_page.dart';
import 'library_page.dart';
import '../widgets/drawer.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  final String name_app = "Music Gram";

  int index = 0;

  final screens = [
    const HomePage(),
    const LibraryPage(),
    const ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.home,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.library_music_outlined,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.chat,
        size: 30,
        color: Colors.white,
      ),
    ];
    return Scaffold(
      backgroundColor: const Color(0x00075fb0),
      appBar: AppBar(
        backgroundColor: const Color(0x00075fb0),
        title: Text(
          name_app,
          textAlign: TextAlign.start,
        ),
      ),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 72,
        backgroundColor: Colors.transparent,
        color: Colors.teal.shade600,
        animationDuration: const Duration(milliseconds: 400),
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
      drawer: AppDrawer(),
    );
  }
}
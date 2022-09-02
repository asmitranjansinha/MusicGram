import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00075fb0),
      body: Center(
        child: Text("Your Library is Empty!",
        style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.black,
          color: Colors.teal.shade600,
          animationDuration: Duration(milliseconds: 400),
          items: [
          IconButton(icon:Icon(Icons.home), color: Colors.white, onPressed:() { Navigator.pushNamed(context, AppRoutes.homeRoute);}, ),
          IconButton(icon:Icon(Icons.library_music_outlined), color: Colors.white, onPressed:() {Navigator.pushNamed(context, AppRoutes.libraryRoute);}, ),
          IconButton(icon:Icon(Icons.chat), color: Colors.white, onPressed: () {Navigator.pushNamed(context, AppRoutes.chatRoute);},),
        ]),
    );
  }
}
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final int days = 309;
  final String name_app = "Catalog App";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$name_app"),
        ),
        body: Center(
          child: Container(
            child: Text("Welcome to our $name_app!"),
          ),
        ),
      drawer: Drawer(),
      );
    }
}
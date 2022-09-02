import 'package:flutter/material.dart';
import 'package:null_app/widgets/drawer.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  final String name_app = "Music Gram";

  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
        backgroundColor: Color(0x00075fb0),
          appBar: AppBar(
            backgroundColor: Color(0x00075fb0),
            title: Text(name_app,
            textAlign: TextAlign.center,),
          ),
          body: Center(
            child: Text("Welcome to $name_app!"),
          ),
        drawer: const AppDrawer(),
        );
    }
}
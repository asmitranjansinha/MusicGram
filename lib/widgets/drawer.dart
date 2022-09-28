// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black54,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 50),
            children: const [
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                  size: 130,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black54,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child:  UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black54),
                margin: EdgeInsets.zero,
                accountName: Text("Asmit Ranjan Sinah"),
                accountEmail: Text("sinhaasmit99@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profilephoto.png")
                  ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white,),
              title: Text("Home",
              textScaleFactor: 1.3,
              style: TextStyle(
                color: Colors.white
              ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
              title: Text("Profile",
              textScaleFactor: 1.3,
              style: TextStyle(
                color: Colors.white
              ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white,),
              title: Text("E-Mail",
              textScaleFactor: 1.3,
              style: TextStyle(
                color: Colors.white
              ),),
            )
          ],
        ),
      ),
    );
  }
}
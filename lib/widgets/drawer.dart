import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black54,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black54),
                margin: EdgeInsets.zero,
                accountName: Text("Asmit Ranjan Sinah"),
                accountEmail: Text("sinhaasmit99@gmail.com"),
                currentAccountPicture: CircleAvatar(),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "E-Mail",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.arrow_left,
                color: Colors.white,
              ),
              title: const Text(
                "Log Out",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.loginRoute,
                    (route) => false,
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:null_app/screens/chat_page.dart';
import 'package:null_app/screens/home_page.dart';
import 'package:null_app/screens/library_page.dart';
import 'package:null_app/screens/login_page.dart';
import 'package:null_app/screens/main_activity.dart';
import 'package:null_app/screens/sign_up.dart';
import 'package:null_app/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final storage = new FlutterSecureStorage();

  Future<bool> checkLoginStatus() async {
    String? value = await storage.read(key: "uid");
    if (value == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: checkLoginStatus(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == false) {
              return LoginPage();
            }
            return MainActivity();
          }),
      routes: {
        AppRoutes.homeRoute: (context) => const HomePage(),
        AppRoutes.loginRoute: (context) => const LoginPage(),
        AppRoutes.signupRoute: (context) => const SignupPage(),
        AppRoutes.libraryRoute: (context) => const LibraryPage(),
        AppRoutes.chatRoute: (context) => const ChatPage(),
        AppRoutes.mainactivityRoute:(context) => MainActivity(),
      },
    );
  }
}

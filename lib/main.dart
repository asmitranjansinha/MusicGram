import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:null_app/screens/chat_page.dart';
import 'package:null_app/screens/home_page.dart';
import 'package:null_app/screens/library_page.dart';
import 'package:null_app/screens/login_page.dart';
import 'package:null_app/screens/sign_up.dart';
import 'package:null_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => const LoginPage(),
        AppRoutes.homeRoute:(context)  => const HomePage(),
        AppRoutes.loginRoute:(context) => const LoginPage(),
        AppRoutes.signupRoute:(context) => const SignupPage(),
        AppRoutes.libraryRoute:(context) => const LibraryPage(),
        AppRoutes.chatRoute:(context) => const ChatPage(),
      },
    );
  }
}
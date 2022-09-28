import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:null_app/helper/helper_function.dart';
import 'package:null_app/screens/chat_page.dart';
import 'package:null_app/screens/home_page.dart';
import 'package:null_app/screens/library_page.dart';
import 'package:null_app/screens/login_page.dart';
import 'package:null_app/screens/main_activity.dart';
import 'package:null_app/screens/sign_up.dart';
import 'package:null_app/utils/routes.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;


  // Future<bool> checkLoginStatus() async {
  //   String? value = await storage.read(key: "uid");
  //   if (value == null) {
  //     return false;
  //   }
  //   return true;
  // }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async{
    await HelperFunction.getUserLoggedInStatus().then((value) {
      if(value!=null){
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? const MainActivity() : const LoginPage(),
      routes: {
        AppRoutes.homeRoute: (context) => const HomePage(),
        AppRoutes.loginRoute: (context) => const LoginPage(),
        AppRoutes.signupRoute: (context) => const SignupPage(),
        AppRoutes.libraryRoute: (context) => LibraryPage(),
        AppRoutes.chatRoute: (context) => const ChatPage(),
        AppRoutes.mainactivityRoute: (context) => const MainActivity(),
      },
    );
  }
}

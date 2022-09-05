// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:null_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  Future signIn() async {
    log("signed in");
    var usr = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

    if (usr.user != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.homeRoute, (route) => false);
    }

    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
    }
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00075fb0),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Image.asset(
              "assets/images/undraw_happy_music_g6wc.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              "Login",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text(
              "Welcome $name!",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
              child: Form(
                key: _formkey,
                child: Column(children: [
                  TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      hintText: "E-Mail",
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      icon: const Icon(
                        CupertinoIcons.mail,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "E-Mail field cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    style: const TextStyle(color: Colors.grey),
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        icon: const Icon(
                          CupertinoIcons.lock,
                          color: Colors.grey,
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 6) {
                        return "Password length should be atleast of 6 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Material(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 30),
                    child: InkWell(
                      onTap: () => signIn(),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: changeButton ? 50 : 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "don't have an account?",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.signupRoute);
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.teal),
                          ))
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

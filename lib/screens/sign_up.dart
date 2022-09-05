import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/routes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool changesignupButton = false;

  final _formkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  Future signUp() async {
    log("Signed Up");
    UserCredential usr;
    usr = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

    if (usr.user != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.mainactivityRoute, (route) => false);
    }

    if (_formkey.currentState!.validate()) {
      setState(() {
        changesignupButton = true;
      });
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00075fb0),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color(0x00075fb0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.grey,
                    iconSize: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Column(children: const [
                    Text(
                      "Create Account",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Please fill the input below",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(children: [
                    TextFormField(
                      style: const TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                          hintText: "Full Name",
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          icon: const Icon(
                            CupertinoIcons.person,
                            color: Colors.grey,
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name field cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                          hintText: "EMAIL",
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          icon: const Icon(
                            CupertinoIcons.mail,
                            color: Colors.grey,
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "E-Mail field cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
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
                      height: 30,
                    ),
                    TextFormField(
                      controller: _confirmpasswordController,
                      style: const TextStyle(color: Colors.grey),
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
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
                  ]),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 110),
                  child: Material(
                    color: Colors.teal,
                    borderRadius:
                        BorderRadius.circular(changesignupButton ? 50 : 30),
                    child: InkWell(
                      onTap: () => signUp(),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: changesignupButton ? 50 : 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: changesignupButton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                "SIGN UP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already, have an account?",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.loginRoute);
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.teal),
                        ))
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

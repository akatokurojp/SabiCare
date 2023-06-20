// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lit_ui_kit/lit_ui_kit.dart';
import 'package:sabicare/register.dart';

import 'Controllers/authcontroller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 93, 169, 192),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50),
                ),
                Text(
                  "Let's get you set up!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                      fontFamily: 'quicksand'),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                ),

                LitElevatedCard(
                  child: Column(
                    children: [
                      // email container
                      Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                          child: TextField(
                            controller: authController.loginEmailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // password container
                      Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                          child: TextField(
                            obscureText: true,
                            controller: authController.loginPasswordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                            ),
                          ),
                        ),
                      ),
                      //forgot password
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: (() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                              }),
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 30,
                ),

                //or
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              thickness: 2,
                            ))),
                    Text(
                      "or",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 10.0),
                            child: Divider(
                              color: Colors.black,
                              thickness: 2,
                            ))),
                  ],
                ),

                SizedBox(
                  height: 80,
                ),

                //sign with google
                // Container(
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       border: Border.all(color: Colors.black),
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Padding(
                //     padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                //     child: Row(
                //       children: [
                //         Image(
                //           image: AssetImage("lib/assets/icons/google.png"),
                //           height: 30,
                //           width: 30,
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.only(left: 40.0),
                //           child: Text(
                //             "Continue with Google",
                //             style: TextStyle(fontSize: 18),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: 80,
                ),

                //button sign in
                GestureDetector(
                  onTap: () {
                    authController.loginUser();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff695CFE),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                            child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )),
                      )),
                ),

                SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("I don't have an account yet?",
                        style: TextStyle(fontSize: 17)),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        "Sign up",
                        style:
                            TextStyle(fontSize: 17, color: Color(0xff695CFE)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

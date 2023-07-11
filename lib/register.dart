// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lit_ui_kit/lit_ui_kit.dart';
import 'package:sabicare/Login.dart';
import 'package:sabicare/static/colors.dart';

import 'Controllers/authcontroller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //sign up
                Text(
                  "Sign up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: textColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter information to create your account",
                  style: TextStyle(fontSize: 20, color: textColor),
                ),

                SizedBox(
                  height: 40,
                ),

                //textfield username
                LitElevatedCard(
                  child: Column(
                    children: [
                      Text("Sign up"),
                      Padding(padding: EdgeInsets.only(top: 15, bottom: 5)),
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: TextField(
                          controller: authController.emailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your Email",
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              icon: Icon(Icons.account_circle_rounded,
                                  color: bgColor),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: bgColor)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: bgColor))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: TextField(
                          obscureText: true,
                          controller: authController.passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your Password",
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            icon: Icon(
                              Icons.key,
                              color: bgColor,
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: bgColor)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: bgColor)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: TextField(
                          obscureText: true,
                          controller: authController.confirmpasswordController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your Password again",
                              labelText: "Confirm Password",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              icon: Icon(
                                Icons.key,
                                color: bgColor,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: bgColor)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: bgColor))),
                        ),
                      ),
                      // nama
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: TextField(
                          obscureText: true,
                          controller: authController.nameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your Name",
                              labelText: "Enter your Name",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              icon: Icon(
                                Icons.verified_user,
                                color: bgColor,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: bgColor)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: bgColor))),
                        ),
                      ),

                      // Age
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: TextField(
                          obscureText: true,
                          controller: authController.ageController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your Age",
                              labelText: "Enter your Age",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              icon: Icon(
                                Icons.numbers_outlined,
                                color: bgColor,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: bgColor)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: bgColor))),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),

                //textfielf email

                //textfield password

                SizedBox(
                  height: 40,
                ),

                //button sign up
                GestureDetector(
                  onTap: () {
                    authController.createAccount();
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 12, right: 12),
                      decoration: BoxDecoration(
                          color: signInColor,
                          borderRadius: BorderRadius.circular(22)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                            child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )),
                      )),
                ),

                SizedBox(
                  height: 25,
                ),

                //already have and account?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an accont?",
                        style: TextStyle(fontSize: 17)),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(fontSize: 17, color: linkColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

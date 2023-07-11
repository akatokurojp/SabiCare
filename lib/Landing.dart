import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sabicare/Login.dart';

import 'home.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 93, 169, 192),
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 20),
              child: Text(
                'SABICARE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 244, 250, 251),
                  fontSize: 28,
                  fontFamily:
                      'Questrial', // Use GoogleFonts.questrial as a font family
                ),
              ),
            ),
            // big logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                    'https://assets8.lottiefiles.com/packages/lf20_bwnb4x2t.json',
                    height: 450,
                    width: 350),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 100.0,
                right: 100.0,
                top: 20,
                bottom: MediaQuery.of(context).size.height / 25,
              ),
            ),

            // we deliver groceries at your doorstep
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Make your life healthier!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 244, 250, 251),
                    fontSize: 28,
                    fontFamily: 'Questrial',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // get started button
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const LoginPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      // Define your custom transition animation
                      return FadeTransition(
                        opacity: animation,
                        child:
                            const LoginPage(), // Replace with the destination page widget
                      );
                    },
                  ),
                );
              },
              child: Center(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(right: 5, left: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 244, 250, 251),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Get Started",
                          style: TextStyle(
                            color: Color.fromARGB(255, 93, 169, 192),
                            // fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 + 30,
                        ),
                        const Text(
                          "->",
                          style: TextStyle(
                            color: Color.fromARGB(255, 93, 169, 192),
                            // fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      ],
                    )),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Chatting extends StatefulWidget {
  const Chatting({super.key});

  @override
  State<Chatting> createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 93, 169, 192),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(
                20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

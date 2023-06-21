import 'package:flutter/material.dart';

class ChatLogPage extends StatefulWidget {
  const ChatLogPage({super.key});

  @override
  State<ChatLogPage> createState() => _ChatLogPageState();
}

class _ChatLogPageState extends State<ChatLogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lit_ui_kit/lit_ui_kit.dart';
import 'package:sabicare/static/colors.dart';

class ChatLogPage extends StatefulWidget {
  const ChatLogPage({super.key});

  @override
  State<ChatLogPage> createState() => _ChatLogPageState();
}

class _ChatLogPageState extends State<ChatLogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.keyboard_return,
          color: Colors.white,
          size: 32,
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        title: const Text(
          "Messages",
          style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text("P"),
                  ),
                  title: Text('Doctor Aberdeen'),
                  subtitle: Text('It seems you have a conditions of ligma'),
                  trailing: Icon(Icons.more_vert),
                ),
              ))
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
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
      appBar: topBar("Messages"),
      body: SafeArea(
          child: ListView(
        children: [
          const Padding(
              padding: EdgeInsets.all(8),
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

import 'package:flutter/material.dart';
import 'package:sabicare/static/colors.dart';

class MessagingPage extends StatefulWidget {
  const MessagingPage({super.key});

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar("Messaging page", context),
      body: SafeArea(
        child: ListView(),
      ),
    );
  }
}

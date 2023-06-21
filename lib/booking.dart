import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sabicare/static/colors.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
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
            "Transaction history",
            style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
          ),
        ),
        body: SafeArea(child: ListView()));
  }
}

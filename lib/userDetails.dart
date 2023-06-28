import 'package:flutter/material.dart';
import 'package:sabicare/static/colors.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  List<String> listDocument = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar("User Details Form"),
      body: SafeArea(
          child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Data",
                    style: detailText(),
                  ),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(width: 1, color: Colors.black)),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      child: TextField(
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ))
              ],
            ),
          ),
        ],
      )),
    );
  }

  TextStyle detailText() => const TextStyle(color: textColor, fontSize: 18);
}

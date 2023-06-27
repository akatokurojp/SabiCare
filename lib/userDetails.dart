import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sabicare/static/colors.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar("User Details Form"),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Data",
                    style: detailText(),
                  ),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(width: 1, color: Colors.black)),
                    child: Padding(
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

  TextStyle detailText() => TextStyle(color: textColor, fontSize: 18);
}

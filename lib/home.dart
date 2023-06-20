import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 93, 169, 192),
      body: SafeArea(
          child: SafeArea(
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(20)), // top padding
            Row(
              // row for avatar and text
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child:
                      Icon(Icons.account_circle_rounded, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Morning, ",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'quicksand'), //import quicksand font
                  ),
                )
              ],
            ), // space between leading avatar and options
            Container(
              padding: EdgeInsets.only(bottom: 10),
            ), // space between leading avatar and options
            Row(
              children: [
                // avatar row for options
                Padding(padding: EdgeInsets.all(5)),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 5, top: 5, right: 10, left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.black,
                    child: const Text('Self '),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 5, top: 5, right: 10, left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.black,
                    child: const Text('set appt'),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 5, top: 5, right: 10, left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.brown.shade800,
                    child: const Text('chat'),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 5, top: 5, right: 10, left: 10),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.brown.shade800,
                    child: const Text('All ftr'),
                  ),
                )
              ],
            ),
            // SABICARE Your All-in-one ENT App
          ],
        ),
      )),
    );
  }
}

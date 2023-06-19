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
            Padding(padding: EdgeInsets.all(20)),
            Row(
              children: [
                // avatar row
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
            )
          ],
        ),
      )),
    );
  }
}

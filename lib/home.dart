import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lit_ui_kit/lit_ui_kit.dart';
import 'package:sabicare/static/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
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
                        fontFamily: 'quicksand',
                        color: Colors.white), //import quicksand font
                  ),
                )
              ],
            ), // space between leading avatar and options
            Container(
              padding: EdgeInsets.only(bottom: 10),
            ), // space between leading avatar and options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // avatar row for options
                Padding(padding: EdgeInsets.all(5)),
                GestureDetector(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 3, top: 5, right: 10, left: 10),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          child: Text('Self '),
                        ),
                      ),
                      Text(
                        "Self",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text("Diagnose", style: TextStyle(color: Colors.white))
                    ],
                  ),
                  // onTap: () => ,
                ),
                GestureDetector(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 3, top: 5, right: 10, left: 10),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          child: Text('Appt'),
                        ),
                      ),
                      Text("Set an", style: TextStyle(color: Colors.white)),
                      Text("Appointment", style: TextStyle(color: Colors.white))
                    ],
                  ),
                  // onTap: () => ,
                ),
                GestureDetector(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 3, top: 5, right: 10, left: 10),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          child: Text('Chat'),
                        ),
                      ),
                      Text("Chat", style: TextStyle(color: Colors.white)),
                      Text("with Doctor", style: TextStyle(color: Colors.white))
                    ],
                  ),
                  // onTap: () => ,
                ),
                GestureDetector(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 3, top: 5, right: 10, left: 10),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          child: Text('ftr'),
                        ),
                      ),
                      Text("All", style: TextStyle(color: Colors.white)),
                      Text("Features", style: TextStyle(color: Colors.white))
                    ],
                  ),
                  // onTap: () => ,
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Text(' '),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "SABICARE",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text("Your all-in-one ENT app",
                        style: TextStyle(color: Colors.white)),
                  )
                ], // SABICARE Your All-in-one ENT App
              ),
            ),
            Container(
              height: 200,
              width: 200,
              child: LitElevatedCard(
                borderRadius: BorderRadius.circular(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Get Expert anytime, anywhere!",
                          style: TextStyle(fontSize: 25)),
                      const Text(
                        "Introducing our Chatbot with Expert System: Your personalized Patients Education Assistant",
                        style: TextStyle(fontSize: 14, fontFamily: 'quicksand'),
                      ),
                      Padding(padding: EdgeInsets.only(top: 14)),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Padding(
                            padding: EdgeInsets.only(top: 1, right: 1),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.blueGrey)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 32, left: 32),
                                child: Text(
                                  "Start now!",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              onPressed: () {},
                            ))
                      ])
                    ]),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              child: LitElevatedCard(
                borderRadius: BorderRadius.circular(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Easy Appointment booking with SABICARE",
                          style: TextStyle(fontSize: 25)),
                      const Text(
                        "SABICARE: Book ENT appointment easy, fast, and hassle-free",
                        style: TextStyle(fontSize: 14, fontFamily: 'quicksand'),
                      ),
                      Padding(padding: EdgeInsets.only(top: 14)),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Padding(
                            padding: EdgeInsets.only(top: 1, right: 1),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.blueGrey)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 32, left: 32),
                                child: Text(
                                  "Book now!",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              onPressed: () {},
                            ))
                      ])
                    ]),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

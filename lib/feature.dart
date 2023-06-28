// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:lit_ui_kit/containers.dart';
import 'package:sabicare/static/colors.dart';

import 'Controllers/authcontroller.dart';

class CompleteFeaturePage extends StatefulWidget {
  const CompleteFeaturePage({super.key});

  @override
  State<CompleteFeaturePage> createState() => _CompleteFeaturePageState();
}

class _CompleteFeaturePageState extends State<CompleteFeaturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar("Complete App Features"),
      backgroundColor: bgColor,
      body: SafeArea(
          child: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Your favorite features",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                Padding(
                    padding:
                        EdgeInsets.only(right: 25, left: 8, top: 8, bottom: 8),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(signInColor)),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8, left: 8),
                        child: Text(
                          "Edit",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      onPressed: () {},
                    )),
              ],
            ),
            // const Padding(padding: EdgeInsets.all(15)), // top padding

            Container(
              padding: const EdgeInsets.only(bottom: 10),
            ), // space between leading avatar and options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // avatar row for options
                const Padding(padding: EdgeInsets.all(5)),
                GestureDetector(
                  child: Column(
                    children: [
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
                    children: [
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
                    children: [
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
                    children: [
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
            SizedBox(
              height: 25,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    "Main features",
                    style: TextStyle(fontSize: 25, color: textColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 8),
                  child: GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.medical_information,
                            size: 30,
                          )),
                      title: Text(
                        "Chat with Doctor",
                        style: featureText(),
                      ),
                      subtitle: Text(
                        "Consultation with your doctor",
                        style: featureText(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.store,
                            size: 30,
                          )),
                      title: Text(
                        "Drug Store",
                        style: featureText(),
                      ),
                      subtitle: Text(
                        "Your trusted apothecary",
                        style: featureText(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.calendar_month,
                            size: 30,
                          )),
                      title: Text(
                        "Set an Appointment",
                        style: featureText(),
                      ),
                      subtitle: Text(
                        "Set an offline appointment",
                        style: featureText(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    "Specialized Features",
                    style: TextStyle(fontSize: 25, color: textColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 8),
                  child: GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.mark_chat_read_sharp,
                            size: 30,
                          )),
                      title: Text(
                        "Diagnose yourself",
                        style: featureText(),
                      ),
                      subtitle: Text(
                        "Talk with our chatbot",
                        style: featureText(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    "User Settings",
                    style: TextStyle(fontSize: 25, color: textColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 8),
                  child: GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.account_box,
                            size: 30,
                          )),
                      title: Text(
                        "Your profile",
                        style: featureText(),
                      ),
                      subtitle: Text(
                        "Set your profile",
                        style: featureText(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      )),
    );
  }

  TextStyle featureText() {
    return TextStyle(color: textColor, fontSize: 17, fontFamily: 'quicksand');
  }
}
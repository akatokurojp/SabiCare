// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sabicare/Login.dart';
import 'package:sabicare/booking.dart';
import 'package:sabicare/static/colors.dart';
import 'package:sabicare/testingjoko/testchat.dart';
import 'package:sabicare/userDetails.dart';

import 'consul.dart';

class CompleteFeaturePage extends StatefulWidget {
  const CompleteFeaturePage({super.key});

  @override
  State<CompleteFeaturePage> createState() => _CompleteFeaturePageState();
}

class _CompleteFeaturePageState extends State<CompleteFeaturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar("Complete App Features", context),
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
                            radius: 30,
                            child: Icon(
                              Icons.accessibility_new,
                              size: 30,
                            )),
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
                            radius: 30,
                            child: Icon(
                              Icons.calendar_month,
                              size: 30,
                            )),
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
                            radius: 30,
                            child: Icon(
                              Icons.medical_information,
                              size: 30,
                            )),
                      ),
                      Text("Chat", style: TextStyle(color: Colors.white)),
                      Text("with Doctor", style: TextStyle(color: Colors.white))
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConsultationPage(),
                        ));
                  },
                ),
                GestureDetector(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 3, top: 5, right: 10, left: 10),
                        child: CircleAvatar(
                            radius: 30,
                            child: Icon(
                              Icons.store,
                              size: 30,
                            )),
                      ),
                      Text("Drug", style: TextStyle(color: Colors.white)),
                      Text("Store", style: TextStyle(color: Colors.white))
                    ],
                  ),
                  // onTap: () {} ,
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Chat(),
                          ));
                    },
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookingPage(),
                          ));
                    },
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserDetailsPage(),
                          ));
                    },
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
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: GestureDetector(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.logout,
                            size: 30,
                          )),
                      title: Text(
                        "Logout",
                        style: featureText(),
                      ),
                      subtitle: Text(
                        "Logout from your account",
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

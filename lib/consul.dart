import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lit_ui_kit/lit_ui_kit.dart';
import 'package:sabicare/static/colors.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar("Chat with doctors"),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(height: 20),
          LitElevatedCard(
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(2),
                  // visualDensity: VisualDensity(horizontal: 1),
                  // dense: true,
                  leading: CircleAvatar(
                    child: Text("P"),
                  ),
                  title: Text('Doctor Aberdeen'),
                  // subtitle: Text('It seems you have a conditions of ligma'),
                  trailing: Icon(Icons.more_vert),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ignore: prefer_const_literals_to_create_immutables
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Padding(
                          //   padding: consulPadding(),
                          //   child: Text(
                          //     "Doctor Aberdeen ",
                          //     style: consulTextStyle(),
                          //   ),
                          // ),
                          Padding(
                            padding: consulPadding(),
                            child: Text(
                              "Experience: ",
                              style: consulTextStyle(),
                            ),
                          ),
                          Padding(
                            padding: consulPadding(),
                            child: Text(
                              "Price: ",
                              style: consulTextStyle(),
                            ),
                          ),
                          // const Padding(padding: EdgeInsets.only(top: 8)),
                        ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Padding(
                        //   // empty space
                        //   padding: consulPadding(),
                        //   child: const Text(""),
                        // ),
                        Padding(
                          padding: consulPadding(),
                          child: Text("data"),
                        ),
                        Padding(
                          padding: consulPadding(),
                          child: Text("data"),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  EdgeInsets consulPadding() => EdgeInsets.only(top: 5, bottom: 5);

  TextStyle consulTextStyle() =>
      TextStyle(fontSize: 15, fontFamily: 'quicksand');
}

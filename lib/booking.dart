import 'package:flutter/material.dart';
import 'package:lit_ui_kit/containers.dart';
import 'package:sabicare/static/colors.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar("Set appointment"),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Select date",
                style: TextStyle(fontSize: 15, color: textColor),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 5),
              child: Text(
                " ",
                style: TextStyle(fontSize: 18, color: textColor),
              ),
            ),
            SizedBox(
              height: 85,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(30, (int index) {
                  DateTime currentDate = DateTime.now();
                  DateTime oneMonthLater =
                      currentDate.add(Duration(hours: 30 * index));

                  // Format the date using DateFormat
                  String formattedDate =
                      DateFormat('dd-MMMM').format(oneMonthLater);
                  // month name: MMMM
                  // day date: dd

                  // Format the day using DateFormat
                  String formattedDay = DateFormat('EEE').format(
                      oneMonthLater); // 'EEE' for short day name (e.g., Mon)
                  return Card(
                    color: textColor,
                    child: SizedBox(
                      width: 85.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    formattedDate), // Display the formatted date
                                Text(formattedDay), // Display the formatted day
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            // const Padding(
            //   padding: EdgeInsets.all(10),
            //   child: Text("Test"),
            // ),
            SizedBox(
              width: 200,
              child: LitElevatedCard(
                borderRadius: BorderRadius.circular(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Card(
                        elevation: 0,
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text("P"),
                          ),
                          title: Text('Doctor Aberdeen'),
                          // subtitle:
                          //     Text('It seems you have a conditions of ligma'),
                          // trailing: Icon(Icons.more_vert),
                        ),
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              "Schedule: ",
                              style: TextStyle(
                                  fontSize: 18, fontFamily: 'quicksand'),
                            ),
                          ),
                          // insert schedule data
                        ],
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              "Availibility: ",
                              style: TextStyle(
                                  fontSize: 18, fontFamily: 'quicksand'),
                            ),
                          ),
                          // insert available data
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 14)),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Column(
                          children: [
                            const Text(
                              "17:00 - 20:00",
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                                padding: const EdgeInsets.only(top: 1, right: 1),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      )),
                                      backgroundColor: const MaterialStatePropertyAll(
                                          Colors.blueGrey)),
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        right: 32, left: 32),
                                    child: Text(
                                      "Available",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  onPressed: () {},
                                )),
                          ],
                        )
                      ])
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

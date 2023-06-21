import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lit_ui_kit/lit_ui_kit.dart';
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
          "Set appointment",
          style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Select date",
                style: TextStyle(fontSize: 15, color: textColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 5),
              child: Text(
                "April, 2022",
                style: TextStyle(fontSize: 18, color: textColor),
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(30, (int index) {
                  DateTime currentDate = DateTime.now();
                  DateTime oneMonthLater =
                      currentDate.add(Duration(days: 30 * index));

                  // Format the date using DateFormat
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(oneMonthLater);
// 'dd' for two-digit date format

                  // Format the day using DateFormat
                  String formattedDay = DateFormat('EEE').format(
                      oneMonthLater); // 'EEE' for short day name (e.g., Mon)

                  return Card(
                    color: textColor,
                    child: Container(
                      width: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("Test"),
            )
          ],
        ),
      ),
    );
  }
}

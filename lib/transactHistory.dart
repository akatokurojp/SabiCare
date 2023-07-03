import 'package:flutter/material.dart';
import 'package:lit_ui_kit/containers.dart';
import 'package:sabicare/static/colors.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar("Transaction History"),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            width: 200,
            child: LitElevatedCard(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Appointment: ", style: TextStyle(fontSize: 18)),
                    const Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        "Doctor: ",
                        style: TextStyle(fontSize: 18, fontFamily: 'quicksand'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        "Appt ID  : ",
                        style: TextStyle(fontSize: 18, fontFamily: 'quicksand'),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 14)),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Column(
                        children: [
                          const Text(
                            "Invoice",
                            style:
                                TextStyle(fontSize: 18, color: grayTextColor),
                          ),
                          const Text("Rp. 100.000,00"),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                              padding: const EdgeInsets.only(top: 1, right: 1),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    )),
                                    backgroundColor: const MaterialStatePropertyAll(
                                        Colors.blueGrey)),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      right: 32, left: 32),
                                  child: Text(
                                    "Review",
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
      )),
    );
  }
}

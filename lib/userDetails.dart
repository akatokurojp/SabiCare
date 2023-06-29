import 'package:flutter/material.dart';
import 'package:sabicare/static/colors.dart';
import 'package:intl/intl.dart';
import 'package:date_field/date_field.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

enum Gender { male, female }

class _UserDetailsPageState extends State<UserDetailsPage> {
  DateTime? selectedDate;
  Gender? _gender = Gender.male;
  List<String> listDocument = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar("User Details Form"),
      body: SafeArea(
          child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Full name",
                    style: detailText(),
                  ),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(width: 1, color: Colors.black)),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      child: TextField(
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    )),
                detailSpacing(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "NIK",
                    style: detailText(),
                  ),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(width: 1, color: Colors.black)),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      child: TextField(
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    )),
                detailSpacing(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Date of birth",
                    style: detailText(),
                  ),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(width: 1, color: Colors.black)),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      child: DateTimeField(
                          initialDate: DateTime(2000),
                          dateFormat: DateFormat('dd-MMMM-yyyy'),
                          mode: DateTimeFieldPickerMode.date,
                          decoration: const InputDecoration(
                            hintText: 'Date of Birth',
                          ),
                          selectedDate: selectedDate,
                          onDateSelected: (DateTime value) {
                            setState(() {
                              selectedDate = value;
                            });
                          }),
                    )),
                detailSpacing(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Gender",
                    style: detailText(),
                  ),
                ),
                RadioListTile<Gender>(
                  // contentPadding: EdgeInsets.all(0),
                  title: Text(
                    "male",
                    style: detailText(),
                  ),
                  value: Gender.male,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                RadioListTile<Gender>(
                  // contentPadding: EdgeInsets.all(0),
                  title: Text(
                    "female",
                    style: detailText(),
                  ),
                  value: Gender.female,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                detailSpacing(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Height",
                    style: detailText(),
                  ),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(width: 1, color: Colors.black)),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.numberWithOptions(),
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Text(
                              "cm",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    )),
                detailSpacing(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Weight",
                    style: detailText(),
                  ),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(width: 1, color: Colors.black)),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.numberWithOptions(),
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Text(
                              "kg",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    )),
                detailSpacing(),
                detailSpacing(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff457B9D),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                            child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )),
                      )),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  SizedBox detailSpacing() {
    return const SizedBox(
      height: 8,
    );
  }

  TextStyle detailText() => const TextStyle(color: textColor, fontSize: 18);
}

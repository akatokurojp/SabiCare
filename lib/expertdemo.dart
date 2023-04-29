import 'package:flutter/material.dart';

class ExpertSystemDemo extends StatefulWidget {
  @override
  _ExpertSystemDemoState createState() => _ExpertSystemDemoState();
}

class _ExpertSystemDemoState extends State<ExpertSystemDemo> {
  bool earHurting = false;
  bool earItchy = false;
  bool liquidLeaking = false;
  String diagnosis = '';

  void diagnoseEarIssue() {
    if (earHurting && earItchy && liquidLeaking) {
      setState(() {
        diagnosis = 'Otitis Media'; // Ear hurting, itchy, and liquid leaking
      });
    } else if (earHurting && earItchy) {
      setState(() {
        diagnosis = 'Otitis Externa'; // Ear hurting and itchy
      });
    } else if (earHurting) {
      setState(() {
        diagnosis = 'Tinnitus'; // Ear hurting only
      });
    } else {
      setState(() {
        diagnosis = 'No Diagnosis'; // No matching diagnosis
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expert System Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Symptoms:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            CheckboxListTile(
              title: Text('Ear Hurting'),
              value: earHurting,
              onChanged: (value) {
                setState(() {
                  earHurting = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Ear Itchy'),
              value: earItchy,
              onChanged: (value) {
                setState(() {
                  earItchy = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Liquid Leaking'),
              value: liquidLeaking,
              onChanged: (value) {
                setState(() {
                  liquidLeaking = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                diagnoseEarIssue();
              },
              child: Text('Diagnose'),
            ),
            SizedBox(height: 20),
            Text(
              'Diagnosis: $diagnosis',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

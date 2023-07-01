import 'package:flutter/material.dart';

class ExpertSystemDemo extends StatefulWidget {
  const ExpertSystemDemo({super.key});

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
        title: const Text('Expert System Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select Symptoms:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              title: const Text('Ear Hurting'),
              value: earHurting,
              onChanged: (value) {
                setState(() {
                  earHurting = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Ear Itchy'),
              value: earItchy,
              onChanged: (value) {
                setState(() {
                  earItchy = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Liquid Leaking'),
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
              child: const Text('Diagnose'),
            ),
            const SizedBox(height: 20),
            Text(
              'Diagnosis: $diagnosis',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

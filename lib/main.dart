import 'package:flutter/material.dart';
import 'package:sabicare/Landing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sabicare/bottom.dart';
import 'package:sabicare/home.dart';

import 'Login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue
        canvasColor: Color.fromARGB(255, 93, 169, 192),
      ),
      home: BottomPage(),
    );
  }
}

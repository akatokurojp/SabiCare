import 'package:flutter/material.dart';
// import 'package:sabicare/Landing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sabicare/landing.dart';
import 'package:sabicare/static/colors.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
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
        canvasColor: bgColor,
      ),
      home: const IntroScreen(),
    );
  }
}

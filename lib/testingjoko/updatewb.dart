import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth authInstace = FirebaseAuth.instance;
    authInstace.signInWithEmailAndPassword(
        email: 'wibi@wibi.com', password: 'wibi1234');
    authInstace.currentUser!.updateDisplayName('Wibi');

    return const Placeholder();
  }
}

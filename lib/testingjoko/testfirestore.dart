import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

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
  String email = 'wibi@wibi.com';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      //         body: FutureBuilder(
      //   future: Future.wait([getDocumentId(email)]),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     return Center(
      //       child: Text(snapshot.data),
      //     );
      //   },
      // )
      body: Center(
        child: Text('data'),
      ),
    ));
  }
}

Future<String?> getDocumentId(String email) async {
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection('users')
      .where('email', isEqualTo: email)
      .get();

  if (snapshot.docs.isNotEmpty) {
    return snapshot.docs[0].id;
  } else {
    return null;
  }
}

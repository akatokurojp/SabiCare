// ignore_for_file: avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: const ListChat()),
    );
  }
}

class ListChat extends StatefulWidget {
  const ListChat({super.key});

  @override
  State<ListChat> createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      ///users/uhIQ37gqsdaAo99AgiTAP0hdAaw2/chat/ijQGd8lKslPMPSkdrfju51ZpNip1
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc('uhIQ37gqsdaAo99AgiTAP0hdAaw2')
          .collection('chat')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
            snapshot.data!.docs;
        // print(documents);
        print(snapshot.data!.docs);
        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (BuildContext context, int index) {
            // print(documents[index].data());
            print(documents[index].id);
            return Container();
          },
        );
      },
    );
  }
}

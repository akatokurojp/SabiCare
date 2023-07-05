// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
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
    // print(getData());
    getData();
    return Container();
  }
}

getData() {
  Stream<List<String>> listChatTemp;
  String userid = 'uhIQ37gqsdaAo99AgiTAP0hdAaw2';
  // Step 1: Ambil data user yang login
  Stream<DocumentSnapshot<Map<String, dynamic>>> userData =
      FirebaseFirestore.instance.collection('users').doc(userid).snapshots();
  userData.listen((event) {
    // print(event.data());
  });

  // Step 2 : list chat berdasarkan user yg login
  Stream<QuerySnapshot<Map<String, dynamic>>> listChat = FirebaseFirestore
      .instance
      .collection('chats')
      .where('user', isEqualTo: userid)
      .snapshots();
  listChat.listen((event) {
    for (QueryDocumentSnapshot<Map<String, dynamic>> element in event.docs) {
      // print(element.id);
      // print(element.data());
    }
  });

  listChatTemp = listChat.map(
    (QuerySnapshot<Map<String, dynamic>> snapshot) =>
        snapshot.docs.map((document) => document.id).toList(),
  );
  listChatTemp.listen((List<String> ids) {
    print('Document IDs: $ids');
  });
  // Step 3 : chat berdasarkan id chat
  Stream<QuerySnapshot<Map<String, dynamic>>> chat = FirebaseFirestore.instance
      .collection('chats')
      .doc('POJ2JQiHXh8GNX6qPPWu')
      .collection('messages')
      .snapshots();
  chat.listen((event) {
    for (QueryDocumentSnapshot<Map<String, dynamic>> element in event.docs) {
      // print(element.id);
      // print(element.data());
    }
  });
}

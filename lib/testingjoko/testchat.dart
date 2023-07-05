// ignore_for_file: avoid_print

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
            title: const Text('Chat'),
          ),
          body: const Chat()),
    );
  }
}

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder(
            // /users/uhIQ37gqsdaAo99AgiTAP0hdAaw2/chat/ijQGd8lKslPMPSkdrfju51ZpNip1/message
            stream: FirebaseFirestore.instance
                .collection('users') // collection user
                .doc('uhIQ37gqsdaAo99AgiTAP0hdAaw2') // document id user
                .collection('chat') // collection chat
                .doc('ijQGd8lKslPMPSkdrfju51ZpNip1') // document id doctor
                .collection('message') // collection message
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('Terjadi kesalahan: ${snapshot.error}');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                // Mengakses daftar dokumen
                List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
                    snapshot.data!.docs;
                print(documents);
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> data = documents[index].data();
                    // return Row(
                    //   mainAxisAlignment: data['sender'] == 'doctor'
                    //       ? MainAxisAlignment.start
                    //       : MainAxisAlignment.end,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [],
                    // );
                    return ListTile(
                      title: const Text("Sender"),
                      // subtitle: Text(data['sender']),
                      leading: data['sender'] == 'doctor'
                          ? const CircleAvatar()
                          : Text(data['text']),
                      trailing: data['sender'] == 'doctor'
                          ? Text(data['text'])
                          : const CircleAvatar(),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }
}

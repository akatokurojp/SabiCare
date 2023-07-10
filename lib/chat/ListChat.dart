// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:lit_ui_kit/containers.dart';
import 'package:sabicare/static/colors.dart';
import 'chatWithSpecificDoctor.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(title: 'Material App', home: ListChat());
//   }
// }

class ListChat extends StatefulWidget {
  const ListChat({super.key});

  @override
  State<ListChat> createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  late Future<void> fetchData;
  late Stream<QuerySnapshot<Map<String, dynamic>>> stream;
  late String role;
  // String userId = 'uhIQ37gqsdaAo99AgiTAP0hdAaw2';

  @override
  void initState() {
    fetchData = _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        leading: GestureDetector(
          onTap: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_return_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
        title: const Text('Messages'),
      ),
      body: FutureBuilder<void>(
          future: fetchData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                Expanded(
                  child: StreamBuilder(
                    stream: stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Text('Terjadi kesalahan: ${snapshot.error}');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (snapshot.hasData) {
                        List<DocumentSnapshot> documents = snapshot.data.docs;
                        // print(documents);
                        return ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (BuildContext context, int index) {
                            Map<String, dynamic> data =
                                documents[index].data() as Map<String, dynamic>;

                            return StreamBuilder(
                              stream: role == 'doctor'
                                  ? FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(data['user'])
                                      .snapshots()
                                  : FirebaseFirestore.instance
                                      .collection('doctor')
                                      .doc(data['doctor'])
                                      .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                // print(snapshot.data?.data());
                                var respondData = snapshot.data?.data();
                                if (snapshot.hasError) {
                                  return Text(
                                      'Terjadi kesalahan: ${snapshot.error}');
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                }
                                if (snapshot.hasData) {
                                  return GestureDetector(
                                    child: LitElevatedCard(
                                      margin: EdgeInsets.all(4),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: ListTile(
                                          tileColor: textColor,
                                          leading: CircleAvatar(
                                            radius: 25,
                                            child: Icon(
                                              Icons.person,
                                              size: 32,
                                            ),
                                          ),
                                          title: Text(respondData?['nama']),
                                          subtitle: Text((respondData?['umur'])
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TestChat(
                                            chatId: documents[index].id,
                                            doctorId: data['doctor'],
                                            userId: data['user'],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                                return const Text('Data tidak ditemukan');
                              },
                            );
                          },
                        );
                      }
                      return const Text('Data tidak ditemukan');
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }

  Future<void> _fetchData() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        print(value.data());
        if (value.data() == null) {
          setState(() {
            stream = FirebaseFirestore
                .instance // ambil chat berdasarkan user yg login
                .collection('chats')
                .where('doctor',
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots();
            role = 'doctor';
          });
        } else {
          setState(() {
            role = 'user';
            stream = FirebaseFirestore
                .instance // ambil chat berdasarkan user yg login
                .collection('chats')
                .where('user',
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots();
          });
        }
      });

      print(role);
    } catch (error) {
      // Terjadi kesalahan saat mengambil data
      print('Terjadi kesalahan: $error');
    }
  }
}

getData() {
  Stream<List<String>> listChatTemp;
  String userid = 'uhIQ37gqsdaAo99AgiTAP0hdAaw2';
  // Step 1: Ambil data user yang login
  Stream<DocumentSnapshot<Map<String, dynamic>>> userData =
      FirebaseFirestore.instance.collection('users').doc(userid).snapshots();
  userData.listen((event) {
    print(event.data());
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

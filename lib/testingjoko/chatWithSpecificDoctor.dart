import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sabicare/static/colors.dart';

class TestChat extends StatefulWidget {
  final String userId;
  final String doctorId;
  final String chatId;
  const TestChat(
      {super.key,
      required this.userId,
      required this.doctorId,
      required this.chatId});

  @override
  State<TestChat> createState() => _TestChatState();
}

class _TestChatState extends State<TestChat> {
  @override
  Widget build(BuildContext context) {
    var doctorData = FirebaseFirestore.instance
        .collection('doctor')
        .doc(widget.doctorId)
        .get();
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
            future: doctorData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Dr. ${snapshot.data?['nama']}');
              }
              return const Text('Loading...');
            }),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc(widget.chatId)
                  .collection('messages')
                  .orderBy('time')
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<DocumentSnapshot> docChat = snapshot.data.docs;
                  // print(docChat.runtimeType);
                  // return Container();
                  return ListView.builder(
                    itemCount: docChat.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> data =
                          docChat[index].data() as Map<String, dynamic>;
                      print(data);
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: data['sender'] == 'doctor'
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: bgColor,
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        margin:
                                            const EdgeInsets.only(bottom: 12),
                                        decoration: const BoxDecoration(
                                          color: bgColor,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            topLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                            bottomLeft: Radius.circular(12),
                                          ),
                                        ),
                                        child: Text(
                                          data['text'],
                                          style: const TextStyle(
                                              color: textColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        margin:
                                            const EdgeInsets.only(bottom: 12),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            topLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                            bottomLeft: Radius.circular(12),
                                          ),
                                        ),
                                        child: Text(
                                          data['text'],
                                          style: const TextStyle(
                                              color: chatBgColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      const CircleAvatar(
                                        backgroundColor: bgColor,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                      );
                    },
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lit_ui_kit/containers.dart';
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
  late Future<DocumentSnapshot<Map<String, dynamic>>> responder;
  late Future<void> fetchData;
  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    fetchData = _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: fetchData,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: bgColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: bgColor,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.keyboard_return_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              title: FutureBuilder(
                  future: responder,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data?['nama']);
                    }
                    return const Text('Loading...');
                  }),
            ),
            body: Column(
              children: [
                Flexible(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('chats')
                        .doc(widget.chatId)
                        .collection('messages')
                        .orderBy('time')
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<DocumentSnapshot> chat = snapshot.data.docs;
                        // print(chat.runtimeType);
                        // return Container();
                        return Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Container(
                            color: textColor,
                            child: ListView.builder(
                              itemCount: chat.length,
                              itemBuilder: (BuildContext context, int index) {
                                Map<String, dynamic> data =
                                    chat[index].data() as Map<String, dynamic>;
                                print(data);
                                List<Widget> rowWidget = [
                                  AvatarBubble(data['sender']),
                                  SpacingBubble(),
                                  MessageBubble(data['text'], data['sender'])
                                ];

                                return Container(
                                  // padding: EdgeInsets.only(left: 12, right: 12),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12),
                                  child: data['sender'] !=
                                          FirebaseAuth.instance.currentUser!.uid
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: rowWidget,
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children:
                                              (rowWidget.reversed).toList()),
                                );
                              },
                            ),
                          ),
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8, top: 0, left: 3, right: 3),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: textColor,
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                      ),
                      padding: const EdgeInsets.only(top: 3, bottom: 1),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 20, top: 12, bottom: 12, left: 20),
                        child: TextField(
                          controller: inputController,
                          onSubmitted: sendText,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                sendText(inputController.text);
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Icon(
                                Icons.send_rounded,
                                color: grayTextColor,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  void sendText(text) {
    FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.chatId)
        .collection('messages')
        .add({
      'sender': FirebaseAuth.instance.currentUser!.uid,
      'text': text,
      'time': DateTime.now()
    });
    setState(() {
      inputController.clear();
    });
  }

  Future<void> _fetchData() async {
    if (widget.userId == FirebaseAuth.instance.currentUser!.uid) {
      setState(() {
        responder = FirebaseFirestore.instance
            .collection('doctor')
            .doc(widget.doctorId)
            .get();
      });
    } else {
      setState(() {
        responder = FirebaseFirestore.instance
            .collection('users')
            .doc(widget.userId)
            .get();
      });
    }
  }

  CircleAvatar AvatarBubble(sender) {
    return CircleAvatar(
      backgroundColor: sender == FirebaseAuth.instance.currentUser!.uid
          ? bgColor
          : Colors.black,
    );
  }

  SizedBox SpacingBubble() {
    return const SizedBox(
      width: 6,
    );
  }

  Container MessageBubble(chatText, sender) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: sender != FirebaseAuth.instance.currentUser!.uid
            ? bgColor
            : fadeGray,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: Text(
        chatText,
        style: TextStyle(
            color: sender != FirebaseAuth.instance.currentUser!.uid
                ? textColor
                : chatBgColor,
            fontSize: 15,
            fontWeight: sender != FirebaseAuth.instance.currentUser!.uid
                ? FontWeight.w400
                : FontWeight.w400),
      ),
    );
  }
}

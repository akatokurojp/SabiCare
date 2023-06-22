import 'package:flutter/material.dart';
import 'package:lit_ui_kit/lit_ui_kit.dart';
import 'package:sabicare/controllers/gptapiservices.dart';
import 'package:sabicare/static/chatmodel.dart';
import 'package:sabicare/static/colors.dart';
import 'package:sabicare/Controllers/tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({super.key});

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  SpeechToText speechToText = SpeechToText();
  var text = "Hold the button and start speaking ";
  var isListening = false;
  final List<ChatMessage> messages = [];
  TextEditingController inputChat = TextEditingController();

  var scrollController = ScrollController();
  scrollMethod() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: topBackButton,
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        title: const Text(
          "Diagnose Yourself ! ",
          style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  color: isListening ? Colors.black87 : Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: textColor, borderRadius: BorderRadius.circular(12)),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    var chat = messages[index];
                    return chatBubble(chattext: chat.text, type: chat.type);
                  },
                ),
              ),
            ),
            LitElevatedCard(
                child: Padding(
              padding: const EdgeInsets.only(
                top: 3,
                bottom: 1,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Write a message here!",
                  hintStyle: TextStyle(color: fadeGray),
                  suffixIcon: getIcon(inputChat.text),
                ),
                controller: inputChat,
                onChanged: (text) {
                  setState(() {
                    getIcon(inputChat.text);
                  });
                },
                onSubmitted: (text) async {
                  messages
                      .add(ChatMessage(text: text, type: ChatMessageType.user));
                  var msg = await ApiServices.sendMessage(text);
                  String tmsg = msg.toString().trim();
                  // msg = msg.trim();
                  print(text);

                  setState(() {
                    messages.add(
                        ChatMessage(text: tmsg, type: ChatMessageType.bot));
                    inputChat.clear();
                  });

                  Future.delayed(
                    const Duration(milliseconds: 500),
                    () {
                      TextToSpeech.speak(tmsg);
                    },
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget chatBubble({required chattext, required ChatMessageType? type}) {
    if (type == ChatMessageType.bot) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          avatarBubble(type),
          spacingBubble(),
          messageBubble(type, chattext)
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          messageBubble(type, chattext),
          spacingBubble(),
          // avatarBubble(type),
        ],
      );
    }
  }

  getIcon(String text) {
    if (text.length > 0) {
      return GestureDetector(
        child: Icon(
          Icons.send,
          size: 32,
          color: signInColor,
        ),
        onTap: () async {
          messages.add(ChatMessage(text: text, type: ChatMessageType.user));
          var msg = await ApiServices.sendMessage(text);
          String tmsg = msg.toString().trim();
          setState(() {
            messages.add(ChatMessage(text: tmsg, type: ChatMessageType.bot));
            inputChat.clear();
          });
        },
      );
    } else {
      return Icon(
        Icons.mic,
        size: 32,
        color: signInColor,
      );
    }
  }

  SizedBox spacingBubble() {
    return const SizedBox(
      width: 12,
    );
  }

  CircleAvatar avatarBubble(ChatMessageType? type) {
    return CircleAvatar(
      backgroundColor: bgColor,
      child: type == ChatMessageType.bot
          ? Image.asset('assets/icon.png')
          : const Icon(Icons.person, color: Colors.white),
    );
  }

  Container messageBubble(ChatMessageType? type, chattext) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.445,
      child: Container(
        // width: 150,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: type == ChatMessageType.bot ? bgColor : Colors.grey,
          borderRadius: BorderRadius.only(
            topRight: type == ChatMessageType.bot
                ? Radius.circular(12)
                : Radius.circular(1),
            topLeft: type == ChatMessageType.bot
                ? Radius.circular(1)
                : Radius.circular(12),
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Text(
          "$chattext",
          style: TextStyle(
              color: type == ChatMessageType.bot ? textColor : Colors.black,
              fontSize: 15,
              fontWeight: type == ChatMessageType.bot
                  ? FontWeight.w600
                  : FontWeight.w400),
        ),
      ),
    );
  }
}

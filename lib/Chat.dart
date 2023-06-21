import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lit_ui_kit/lit_ui_kit.dart';
import 'package:sabicare/Controllers/authcontroller.dart';
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

  var scrollController = ScrollController();
  scrollMethod() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: AvatarGlow(
      //   endRadius: 75,
      //   animate: isListening,
      //   duration: Duration(milliseconds: 2000),
      //   glowColor: bgColor,
      //   repeat: true,
      //   repeatPauseDuration: Duration(milliseconds: 100),
      //   showTwoGlows: true,
      //   child: GestureDetector(
      //     onTapDown: (details) async {
      //       if (!isListening) {
      //         var available = await speechToText.initialize();
      //         if (available) {
      //           setState(() {
      //             isListening = true;
      //             speechToText.listen(
      //               onResult: (result) {
      //                 setState(() {
      //                   text = result.recognizedWords;
      //                 });
      //               },
      //             );
      //           });
      //         }
      //       }
      //     },
      //     onTapUp: (details) async {
      //       setState(() {
      //         isListening = false;
      //       });
      //       await speechToText.stop();

      //       if (text.isNotEmpty &&
      //           text != "Hold the button and start Speaking") {
      //         messages.add(ChatMessage(text: text, type: ChatMessageType.user));
      //         var msg = await ApiServices.sendMessage(text);
      //         msg = msg.trim();

      //         setState(() {
      //           messages.add(ChatMessage(text: msg, type: ChatMessageType.bot));
      //         });

      //         Future.delayed(Duration(milliseconds: 500), () {
      //           TextToSpeech.speak(msg);
      //         });
      //       } else {
      //         ScaffoldMessenger.of(context).showSnackBar(
      //             SnackBar(content: Text("Failed to process. Try again!")));
      //       }
      //     },
      //     child: CircleAvatar(
      //       backgroundColor: bgColor,
      //       radius: 35,
      //       child: Icon(
      //         isListening ? Icons.mic : Icons.mic_none,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        leading: Icon(
          Icons.keyboard_return_rounded,
          color: Colors.white,
        ),
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
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: chatBgColor,
                    borderRadius: BorderRadius.circular(12)),
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
              padding: EdgeInsets.only(
                top: 3,
                bottom: 1,
              ),
              child: TextField(
                onChanged: (text) async {
                  messages
                      .add(ChatMessage(text: text, type: ChatMessageType.user));
                  var msg = await ApiServices.sendMessage(text);
                  msg = msg.trim();

                  setState(() {
                    messages
                        .add(ChatMessage(text: msg, type: ChatMessageType.bot));
                  });

                  Future.delayed(Duration(milliseconds: 500), () {
                    TextToSpeech.speak(msg);
                  });
                },
                onSubmitted: (text) async {
                  messages
                      .add(ChatMessage(text: text, type: ChatMessageType.user));
                  var msg = await ApiServices.sendMessage(text);
                  msg = msg.trim();
                  print(text);

                  setState(() {
                    messages
                        .add(ChatMessage(text: msg, type: ChatMessageType.bot));
                  });

                  Future.delayed(
                    Duration(milliseconds: 500),
                    () {
                      TextToSpeech.speak(msg);
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: bgColor,
          child: type == ChatMessageType.bot
              ? Image.asset('assets/icon.png')
              : Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: type == ChatMessageType.bot ? bgColor : Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Text(
              "$chattext",
              style: TextStyle(
                  color: type == ChatMessageType.bot ? textColor : chatBgColor,
                  fontSize: 15,
                  fontWeight: type == ChatMessageType.bot
                      ? FontWeight.w600
                      : FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}

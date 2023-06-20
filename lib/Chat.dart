import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sabicare/Controllers/gptapiservices.dart';
import 'package:sabicare/static/chatmodel.dart';
import 'package:sabicare/static/colors.dart';
import 'package:sabicare/Controllers/tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

// class Chatting extends StatefulWidget {
//   const Chatting({super.key});

//   @override
//   // State<Chatting> createState() => _ChattingState();
// }

// class _ChattingState extends State<ChatScreen> {
//   SpeechToText speechToText = SpeechToText();
//   var text = "Hold the button and start speaking ";
//   var isListening = false;
//   final List<ChatMessage> messages = [];

//   var scrollController = ScrollController();
//   scrollMethod() {
//     scrollController.animateTo(scrollController.position.maxScrollExtent,
//         duration: Duration(milliseconds: 300), curve: Curves.easeOut);
//   }
// }

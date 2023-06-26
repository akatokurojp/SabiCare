import 'package:flutter/material.dart';

const bgColor = Color.fromARGB(255, 93, 169, 192);
const textColor = Color(0xffFEFDFC);
const chatBgColor = Color(0xff343541);
const linkColor = Color(0xff216864);
const signInColor = Color(0xff457B9D);
const grayTextColor = Color(0xff727272);
const fadeGray = Color.fromARGB(255, 209, 209, 209);
const topBackButton =
    Icon(Icons.keyboard_return_rounded, color: Colors.white, size: 32);

AppBar topBar(String ab) {
  return AppBar(
    leading: topBackButton,
    centerTitle: true,
    backgroundColor: bgColor,
    elevation: 0,
    title: Text(
      ab,
      style: const TextStyle(fontWeight: FontWeight.w600, color: textColor),
    ),
  );
}

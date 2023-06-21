import 'package:flutter/material.dart';
import 'package:sabicare/Chat.dart';
import 'package:sabicare/Login.dart';
import 'package:sabicare/home.dart';
import 'package:sabicare/register.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    LoginPage(),
    RegisterPage(),
    SpeechScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2.5),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(3015),
            topRight: Radius.circular(3015),
          ),
          child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 93, 169, 192),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: _navigateBottomBar,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Home'),
            ],
          ),
        ),
      ),
    );
  }
}

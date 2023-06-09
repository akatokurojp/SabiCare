import 'package:flutter/material.dart';
import 'package:sabicare/chat/ListChat.dart';
import 'package:sabicare/chatlog.dart';
import 'package:sabicare/feature.dart';
import 'package:sabicare/home.dart';
import 'package:sabicare/transactHistory.dart';

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
    const HomePage(),
    // const LoginPage(),
    // const BookingPage(),
    // const ConsultationPage(),
    const ListChat(),
    const TransactionHistoryPage(),
    const CompleteFeaturePage(),
    // const UserDetailsPage(),
    // const DoctorDetailsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2.5),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(3015),
            topRight: Radius.circular(3015),
          ),
          child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 93, 169, 192),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: _navigateBottomBar,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.list_alt_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message_outlined), label: 'Home'),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.person_outline), label: 'Home'),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.format_list_numbered_rtl_sharp),
              //     label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.window), label: 'Home'),
              // BottomNavigationBarItem(icon: Icon(Icons.details), label: 'Home'),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.account_circle), label: 'Home'),
            ],
          ),
        ),
      ),
    );
  }
}

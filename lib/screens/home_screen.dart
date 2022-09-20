import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/contact_screen.dart';
import 'package:zoom_clone/screens/meet_and_chat_screen.dart';
import 'package:zoom_clone/screens/meetings_screen.dart';
import 'package:zoom_clone/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;
  final List<Widget> _screens = [
    const MeetAndChatScreen(),
    const MeetingsScreen(),
    const ContactScreen(),
    const Center(child: Text('Contacts')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        unselectedFontSize: 14,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_rounded),
            label: 'Meet & Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock_rounded),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_rounded),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

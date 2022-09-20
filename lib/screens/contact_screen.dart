import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/bot_screen.dart';
import 'package:zoom_clone/screens/channel_screen.dart';
import 'package:zoom_clone/screens/my_contact_screen.dart';
import 'package:zoom_clone/utils/colors.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor,
            titleSpacing: 0,
            elevation: 0,
            title: const TabBar(
              padding: EdgeInsets.zero,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Chats',
                ),
                Tab(
                  text: 'Channels',
                ),
                Tab(
                  text: 'Bots',
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                ),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          body: const TabBarView(
            children: [
              MyContactScreen(),
              ChannelScreen(),
              BotScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

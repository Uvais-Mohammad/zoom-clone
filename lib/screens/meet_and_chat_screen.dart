import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/jitsi_methods.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/home_icon_button.dart';
import 'package:zoom_clone/widgets/search_bar.dart';

class MeetAndChatScreen extends StatelessWidget {
  const MeetAndChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meet & Chat'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              AuthMethod().signOut();
            },
            icon: const Icon(Icons.chat_bubble_outline_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          const SearchBar(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeIconButton(
                  icon: Icons.video_call,
                  text: 'New Meeting',
                  backgroundColor: Colors.orange,
                  onPressed: () {
                    Random random = Random();
                    int randomNumber = random.nextInt(100000);
                    JitsiMethods().joinMeeting(
                      isAudioMuted: true,
                      isVideoMuted: true,
                      roomName: randomNumber.toString(),
                    );
                  },
                ),
                HomeIconButton(
                  icon: Icons.add_box,
                  text: 'Join',
                  onPressed: () {},
                ),
                HomeIconButton(
                  icon: Icons.calendar_today_rounded,
                  text: 'Schedule',
                  onPressed: () {},
                ),
                HomeIconButton(
                  icon: Icons.arrow_upward_rounded,
                  text: 'Share Screen',
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.grey,
            thickness: 0.4,
          ),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                  color: secondaryBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: const Icon(
                Icons.star,
              ),
            ),
            title: const Text('Starred'),
            onTap: () {},
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                  color: secondaryBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: const Icon(
                Icons.folder,
              ),
            ),
            title: const Text('Folders'),
            onTap: () {},
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          ListTile(
            leading: Container(
              decoration: const BoxDecoration(
                color: secondaryBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  auth.currentUser!.photoURL!,
                ),
              ),
            ),
            title: Text(auth.currentUser!.displayName!),
            onTap: () {},
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
        ],
      ),
    );
  }
}

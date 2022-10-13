import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/utils/colors.dart';

class JoinScreen extends StatelessWidget {
  const JoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthMethod authMethods = AuthMethod();
    final TextEditingController nameController = TextEditingController(
        text: authMethods.firebaseAuth.currentUser!.displayName);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Meeting'),
        centerTitle: true,
        leadingWidth: 80,
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: buttonColor, fontSize: 17),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: secondaryBackgroundColor,
                border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                    top: BorderSide(color: Colors.grey, width: 0.5)),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Meeting ID',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    contentPadding: const EdgeInsets.only(bottom: 8),
                    suffix: IconButton(
                        onPressed: () {},
                        splashRadius: 1,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: const Icon(Icons.keyboard_arrow_down))),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Join with Personal Link',
                style: TextStyle(color: buttonColor, fontSize: 17),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: secondaryBackgroundColor,
                border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                    top: BorderSide(color: Colors.grey, width: 0.5)),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                controller: nameController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Meeting ID',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  contentPadding: EdgeInsets.only(bottom: 8, top: 8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fixedSize: const Size.fromHeight(50),
                ),
                child: const Text('Join'),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Join Options',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Join with Computer Audio'),
              trailing: CupertinoSwitch(onChanged: (value) {}, value: true),
              tileColor: secondaryBackgroundColor,
            ),
            ListTile(
              title: const Text('Join with Video'),
              trailing: CupertinoSwitch(onChanged: (value) {}, value: false),
              tileColor: secondaryBackgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}

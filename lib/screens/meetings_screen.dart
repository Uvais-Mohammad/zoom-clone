import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';
import 'package:zoom_clone/utils/colors.dart';

class MeetingsScreen extends StatelessWidget {
  const MeetingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meetings'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(),
          const Text('Personal Meeting ID'),
          const SizedBox(height: 5),
          const Text(
            '123456789',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: secondaryBackgroundColor,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                child: const Text('Start'),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: secondaryBackgroundColor,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                child: const Text('Send Invitation'),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: secondaryBackgroundColor,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                child: const Text('Edit'),
              ),
            ],
          ),
          const Divider(),
          StreamBuilder(
            stream: FirestoreMethod().meetingHistory,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: (snapshot.data! as dynamic).docs.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    'Room Id: ${(snapshot.data! as dynamic).docs[index]['meetingId']}',
                  ),
                  subtitle: Text(
                    'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['timestamp'].toDate())} at ${DateFormat.jm().format((snapshot.data! as dynamic).docs[index]['timestamp'].toDate())}',
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

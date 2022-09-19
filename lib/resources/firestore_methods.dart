import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreMethod {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map>> get meetingHistory => firebaseFirestore
      .collection('user')
      .doc(firebaseAuth.currentUser!.uid)
      .collection('meetings')
      .orderBy('timestamp', descending: true)
      .snapshots();

  void addMeetingToHistory({
    required String meetingId,
  }) async {
    try {
      await firebaseFirestore
          .collection('user')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('meetings')
          .add({
        'meetingId': meetingId,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}

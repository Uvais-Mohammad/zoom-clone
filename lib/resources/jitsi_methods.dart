import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';

class JitsiMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreMethod _firestoreMethods = FirestoreMethod();
  void joinMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = _auth.currentUser!.displayName
        ..userEmail = _auth.currentUser!.email
        ..userAvatarURL = _auth.currentUser!.photoURL // or .png
        ..audioMuted = isAudioMuted
        ..videoMuted = isAudioMuted;
      _firestoreMethods.addMeetingToHistory(meetingId: roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }
}

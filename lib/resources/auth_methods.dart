import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/firebase_options.dart';

class AuthMethod {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream get authStateChanges => firebaseAuth.authStateChanges();

  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = true;
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn(clientId: DefaultFirebaseOptions.currentPlatform.iosClientId).signIn();

      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );

      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await firebaseFirestore.collection('user').doc(user.tenantId).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
        res = true;
      }
      return res;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
      res = false;
      return res;
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}

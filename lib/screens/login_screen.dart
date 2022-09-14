import 'package:flutter/material.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Image.asset('assets/images/onboarding.jpeg'),
          ),
          CustomButton(onPressed: () {}, text: 'Sign in with Google'),
        ],
      ),
    );
  }
}

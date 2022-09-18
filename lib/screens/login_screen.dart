import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthMethod authMethod = AuthMethod();
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
          CustomButton(
              onPressed: () async {
                bool res = await authMethod.signInWithGoogle(context);
                if (res) {
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              text: 'Sign in with Google'),
        ],
      ),
    );
  }
}

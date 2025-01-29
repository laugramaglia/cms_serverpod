import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:theme_config/theme_config.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            PrimaryButton(
              onPressed: () {
                SignInRoute().go(context);
              },
              label: 'Log in',
            ),
          ],
        ),
      ),
    );
  }
}

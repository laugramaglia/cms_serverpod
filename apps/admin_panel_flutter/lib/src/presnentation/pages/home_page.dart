import 'package:auth/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthRoute().go(context);
          },
          child: const Text('Go to Auth'),
        ),
      ),
    );
  }
}

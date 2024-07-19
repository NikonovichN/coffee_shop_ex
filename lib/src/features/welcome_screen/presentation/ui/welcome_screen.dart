import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:coffee_shop_ex/src/ui_kit/ui_kit.dart';
import 'package:coffee_shop_ex/src/navigation/router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Text('Welcome Screen')),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: CoffeeAppButton.primary(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              onPressed: () => context.go(RouterPath.home.path),
              child: const Text('Get Started'),
            ),
          ),
        ],
      ),
    );
  }
}

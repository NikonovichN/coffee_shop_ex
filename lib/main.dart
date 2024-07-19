import 'package:flutter/material.dart';

import 'src/navigation/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Coffee Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Sora',
      ),
      routerConfig: router,
    );
  }
}

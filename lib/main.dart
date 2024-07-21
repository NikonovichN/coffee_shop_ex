import 'package:flutter/material.dart';

import 'src/navigation/router.dart';
import 'package:coffee_shop_ex/src/ui_kit/atom/fonts.dart';

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
        fontFamily: CoffeeAppFonts.defaultFontFamily,
      ),
      routerConfig: router,
    );
  }
}

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:coffee_shop_ex/src/ui_kit/res/assets.gen.dart';

import 'package:coffee_shop_ex/src/ui_kit/ui_kit.dart';
import 'package:coffee_shop_ex/src/navigation/router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const textPadding = EdgeInsets.symmetric(horizontal: 24.0);
  static const emptySpaceM = SizedBox(height: 32);
  static const emptySpaceXS = SizedBox(height: 8);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.coffeeCup.path),
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(flex: 12),
            Padding(
              padding: textPadding,
              child: Center(
                child: Text(
                  'Fall in Love with Coffee in Blissful Delight!',
                  style: CoffeeAppFonts.semiBold.copyWith(color: CoffeeAppColors.textPrimary),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            emptySpaceXS,
            Padding(
              padding: textPadding,
              child: Center(
                child: Text(
                  'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                  style: CoffeeAppFonts.regular.copyWith(color: CoffeeAppColors.textSecondary),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            emptySpaceM,
            SizedBox(
              width: double.infinity,
              child: CoffeeAppButton.primary(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                onPressed: () => context.go(RouterPath.home.path),
                child: const Text('Get Started'),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

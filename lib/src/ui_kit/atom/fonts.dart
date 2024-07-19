import 'package:flutter/material.dart';

class CoffeeAppFonts {
  const CoffeeAppFonts._();

  static const defaultFontFamily = 'Sora';

  static const TextStyle regular = TextStyle(
    fontSize: 14,
    fontFamily: defaultFontFamily,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle semiBold = TextStyle(
    fontSize: 32,
    fontFamily: defaultFontFamily,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static const TextStyle primaryButton = TextStyle(
    fontSize: 16,
    fontFamily: defaultFontFamily,
    fontWeight: FontWeight.w600,
  );
}

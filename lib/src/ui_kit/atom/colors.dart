import 'package:flutter/material.dart';

class BasicColors {
  const BasicColors._();

  static const Color color01 = Color.fromRGBO(198, 124, 78, 1.0);
  static const Color color02 = Color.fromRGBO(237, 214, 200, 1.0);
  static const Color color03 = Color.fromRGBO(49, 49, 49, 1.0);
  static const Color color04 = Color.fromRGBO(227, 227, 227, 1.0);
  static const Color color05 = Color.fromRGBO(249, 242, 237, 1.0);

  static const Color color01Light = Color.fromRGBO(236, 165, 120, 1);
  static const Color color01Disabled = Color.fromRGBO(179, 164, 155, 1);
}

class CoffeeAppColors {
  const CoffeeAppColors._();

  static const Color buttonBackgroundPrimaryEnabled = BasicColors.color01;
  static const Color buttonBackgroundPrimaryPressed = BasicColors.color01Light;
  static const Color buttonBackgroundDisabled = BasicColors.color01Disabled;
  static const Color buttonLabelPrimary = Colors.white;
  static const Color buttonLabelDisabled = BasicColors.color05;
}

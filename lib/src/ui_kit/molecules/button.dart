import 'package:flutter/material.dart';

import 'package:coffee_shop_ex/src/ui_kit/ui_kit.dart';

class CoffeeAppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonColorScheme colorScheme;
  final TextStyle? textStyle;
  final Color? textColor;
  final bool isLoading;
  final double elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CoffeeAppButton({
    super.key,
    this.onPressed,
    required this.child,
    this.colorScheme = primaryColorScheme,
    this.textStyle,
    this.textColor,
    this.isLoading = false,
    this.elevation = 0,
    this.padding,
    this.margin,
  });

  const CoffeeAppButton.primary({
    super.key,
    this.onPressed,
    required this.child,
    this.colorScheme = primaryColorScheme,
    this.textStyle = CoffeeAppFonts.primaryButton,
    this.textColor = CoffeeAppColors.buttonLabelPrimary,
    this.isLoading = false,
    this.elevation = 0,
    this.padding = const EdgeInsets.all(16.0),
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: isLoading ? () => {} : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(_backgroundColor),
          overlayColor: WidgetStateProperty.resolveWith(_backgroundColor),
          foregroundColor: WidgetStateProperty.resolveWith(_foregroundColor),
          elevation: WidgetStateProperty.resolveWith(_elevation),
          shape: WidgetStateProperty.resolveWith(_shape),
          padding: WidgetStateProperty.resolveWith(_padding),
        ),
        child: DefaultTextStyle(
          style: DefaultTextStyle.of(context).style.merge(textStyle?.copyWith(color: textColor)),
          child: child,
        ),
      ),
    );
  }

  Color _backgroundColor(Set<WidgetState> states) {
    if (isLoading) {
      return colorScheme.loadingBackgroundColor;
    }
    if (states.contains(WidgetState.disabled)) {
      return colorScheme.disabledBackgroundColor;
    }
    if (states.contains(WidgetState.pressed)) {
      return colorScheme.pressedBackgroundColor;
    }
    return colorScheme.defaultBackgroundColor;
  }

  Color _foregroundColor(Set<WidgetState> states) {
    if (isLoading) {
      return colorScheme.loadingForegroundColor;
    }
    if (states.contains(WidgetState.disabled)) {
      return colorScheme.disabledForegroundColor;
    }
    if (states.contains(WidgetState.pressed)) {
      return colorScheme.pressedForegroundColor;
    }
    return colorScheme.defaultForegroundColor;
  }

  OutlinedBorder? _shape(Set<WidgetState> states) {
    return RoundedRectangleBorder(
      borderRadius: CoffeeAppRadius.borderLg,
      side: colorScheme.strokeColorScheme != null
          ? BorderSide(
              width: 1,
              color: _strokeColor(colorScheme.strokeColorScheme!, states),
            )
          : BorderSide.none,
    );
  }

  Color _strokeColor(ButtonStrokeColorScheme colorScheme, Set<WidgetState> states) {
    if (isLoading) {
      return colorScheme.loadingColor;
    }
    if (states.contains(WidgetState.disabled)) {
      return colorScheme.disabledColor;
    }
    if (states.contains(WidgetState.pressed)) {
      return colorScheme.pressedColor;
    }
    return colorScheme.defaultColor;
  }

  double? _elevation(Set<WidgetState> states) {
    if (isLoading) {
      return 0;
    }
    if (states.contains(WidgetState.disabled)) {
      return 0;
    }
    if (states.contains(WidgetState.pressed)) {
      return 0;
    }
    return elevation;
  }

  EdgeInsetsGeometry? _padding(Set<WidgetState> states) {
    return padding ?? EdgeInsets.zero;
  }
}

class ButtonStrokeColorScheme {
  const ButtonStrokeColorScheme({
    required this.defaultColor,
    required this.pressedColor,
    required this.disabledColor,
    required this.loadingColor,
  });

  final Color defaultColor;
  final Color pressedColor;
  final Color disabledColor;
  final Color loadingColor;
}

class ButtonColorScheme {
  final Color defaultBackgroundColor;
  final Color pressedBackgroundColor;
  final Color disabledBackgroundColor;
  final Color loadingBackgroundColor;

  final Color defaultForegroundColor;
  final Color pressedForegroundColor;
  final Color disabledForegroundColor;
  final Color loadingForegroundColor;
  final ButtonStrokeColorScheme? strokeColorScheme;

  const ButtonColorScheme({
    required this.defaultBackgroundColor,
    required this.pressedBackgroundColor,
    required this.disabledBackgroundColor,
    required this.loadingBackgroundColor,
    required this.defaultForegroundColor,
    required this.pressedForegroundColor,
    required this.disabledForegroundColor,
    required this.loadingForegroundColor,
    this.strokeColorScheme,
  });

  ButtonColorScheme copyWith({
    Color? defaultBackgroundColor,
    Color? pressedBackgroundColor,
    Color? disabledBackgroundColor,
    Color? loadingBackgroundColor,
    Color? defaultForegroundColor,
    Color? pressedForegroundColor,
    Color? disabledForegroundColor,
    Color? loadingForegroundColor,
    ValueGetter<ButtonStrokeColorScheme?>? strokeColorScheme,
  }) {
    return ButtonColorScheme(
      defaultBackgroundColor: defaultBackgroundColor ?? this.defaultBackgroundColor,
      pressedBackgroundColor: pressedBackgroundColor ?? this.pressedBackgroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      loadingBackgroundColor: loadingBackgroundColor ?? this.loadingBackgroundColor,
      defaultForegroundColor: defaultForegroundColor ?? this.defaultForegroundColor,
      pressedForegroundColor: pressedForegroundColor ?? this.pressedForegroundColor,
      disabledForegroundColor: disabledForegroundColor ?? this.disabledForegroundColor,
      loadingForegroundColor: loadingForegroundColor ?? this.loadingForegroundColor,
      strokeColorScheme:
          strokeColorScheme != null ? strokeColorScheme.call() : this.strokeColorScheme,
    );
  }
}

const primaryColorScheme = ButtonColorScheme(
  /// background
  defaultBackgroundColor: CoffeeAppColors.buttonBackgroundPrimaryEnabled,
  pressedBackgroundColor: CoffeeAppColors.buttonBackgroundPrimaryPressed,
  disabledBackgroundColor: CoffeeAppColors.buttonBackgroundDisabled,
  loadingBackgroundColor: CoffeeAppColors.buttonBackgroundPrimaryPressed,

  /// foreground
  defaultForegroundColor: CoffeeAppColors.buttonLabelPrimary,
  pressedForegroundColor: CoffeeAppColors.buttonLabelPrimary,
  disabledForegroundColor: CoffeeAppColors.buttonLabelDisabled,
  loadingForegroundColor: CoffeeAppColors.buttonLabelPrimary,
);

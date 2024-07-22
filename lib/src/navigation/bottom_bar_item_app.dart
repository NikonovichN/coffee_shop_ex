import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class BottomBarItemApp extends StatelessWidget {
  final String iconPath;

  const BottomBarItemApp({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            Theme.of(context).iconTheme.color!,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}

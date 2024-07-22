import 'package:coffee_shop_ex/src/ui_kit/res/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:coffee_shop_ex/src/navigation/bottom_bar_item_app.dart';
import 'package:coffee_shop_ex/src/ui_kit/atom/colors.dart';

import '../features/features.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

enum RouterPath {
  welcome("/welcome"),
  home("/home"),
  favorite("/favorite"),
  cart("/cart"),
  reminders("/reminders"),
  ;

  const RouterPath(this.path);

  final String path;
}

final router = GoRouter(
  initialLocation: RouterPath.welcome.path,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RouterPath.welcome.path,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: WelcomeScreen(),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder:
          (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: RouterPath.home.path,
              builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: RouterPath.favorite.path,
              builder: (BuildContext context, GoRouterState state) => const FavoritesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: RouterPath.cart.path,
              builder: (BuildContext context, GoRouterState state) => const CartScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: RouterPath.reminders.path,
              builder: (BuildContext context, GoRouterState state) => const RemindersScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBarApp(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
        items: [
          BottomBarItemApp(iconPath: Assets.svg.home.path),
          BottomBarItemApp(iconPath: Assets.svg.heart.path),
          BottomBarItemApp(iconPath: Assets.svg.bag.path),
          BottomBarItemApp(iconPath: Assets.svg.notification.path),
        ],
      ),
    );
  }

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class BottomNavigationBarApp extends StatelessWidget {
  static const _animationDuration = Duration(milliseconds: 150);

  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomBarItemApp> items;

  const BottomNavigationBarApp({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 99,
      decoration: const BoxDecoration(color: CoffeeAppColors.surfaceWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.asMap().entries.map(
          (entry) {
            final idx = entry.key;
            final widget = entry.value;
            final isActive = idx == currentIndex;

            return Expanded(
              child: GestureDetector(
                onTap: () => onTap(idx),
                child: AnimatedTheme(
                  duration: _animationDuration,
                  data: ThemeData(
                    iconTheme: IconThemeData(
                      color: isActive ? CoffeeAppColors.activeIconButton : Colors.transparent,
                    ),
                  ),
                  child: widget,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

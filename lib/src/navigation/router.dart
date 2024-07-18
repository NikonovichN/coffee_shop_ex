import 'package:coffee_shop_ex/src/features/favorites/presentation/ui/favorites_screen.dart';
import 'package:coffee_shop_ex/src/features/home/presentation/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/features.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

const homePath = '/home';
const registerPath = '/register';

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
              path: '/home',
              builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/favorites',
              builder: (BuildContext context, GoRouterState state) => const FavoritesScreen(),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'A'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'B'),
          // BottomNavigationBarItem(icon: Icon(Icons.tab), label: 'C'),
          // BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_sharp), label: 'D'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/Routes/route_names.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map Screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.policy),
            label: 'Sen Screen',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/$map')) {
      return 0;
    }
    if (location.startsWith('/$sen')) {
      return 1;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).goNamed(map);
        break;
      case 1:
        GoRouter.of(context).goNamed(sen);
        break;
    }
  }
}

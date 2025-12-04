import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/constants.dart';
import 'bottom_nav_bar.dart';

/// Scaffold principal avec bottom nav bar
class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({
    super.key,
    required this.child,
  });

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location == AppConstants.mapRoute) {
      return 0;
    } else if (location == AppConstants.historyRoute) {
      return 1;
    } else if (location == AppConstants.profileRoute) {
      return 2;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _getCurrentIndex(context),
      ),
    );
  }
}

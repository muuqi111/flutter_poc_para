import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/constants.dart';

/// Bottom Navigation Bar personnalisée avec 3 onglets
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            context.go(AppConstants.mapRoute);
            break;
          case 1:
            context.go(AppConstants.historyRoute);
            break;
          case 2:
            context.go(AppConstants.profileRoute);
            break;
        }
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.map_outlined),
          selectedIcon: Icon(Icons.map),
          label: 'Carte',
        ),
        NavigationDestination(
          icon: Icon(Icons.history_outlined),
          selectedIcon: Icon(Icons.history),
          label: 'Historique',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    );
  }
}

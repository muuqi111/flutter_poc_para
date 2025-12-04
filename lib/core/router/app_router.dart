import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// N'oublie pas d'importer ton écran d'onboarding
import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/map/screens/map_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/rental/screens/rental_history_screen.dart';
import '../config/constants.dart';
import '../widgets/main_scaffold.dart';

// 1. On crée un Provider pour savoir si l'intro a été vue.
// Par défaut false, mais on va le surcharger (override) dans le main.dart
final onboardingSeenProvider = StateProvider<bool>((ref) => false);

/// Provider pour le router
final routerProvider = Provider<GoRouter>((ref) {
  // 2. On écoute la valeur du provider
  final hasSeenOnboarding = ref.watch(onboardingSeenProvider);

  return GoRouter(
    // 3. Si on a vu l'intro, on va à la Map, sinon à l'Onboarding
    initialLocation: hasSeenOnboarding ? AppConstants.mapRoute : '/onboarding',
    debugLogDiagnostics: true,
    routes: [
      // 4. Route pour l'Onboarding (En dehors du ShellRoute pour ne pas avoir la barre de nav)
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),

      // Le ShellRoute contient les pages avec la barre de navigation
      ShellRoute(
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: AppConstants.mapRoute,
            name: 'map',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MapScreen()),
          ),
          GoRoute(
            path: AppConstants.historyRoute,
            name: 'history',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: RentalHistoryScreen()),
          ),
          GoRoute(
            path: AppConstants.profileRoute,
            name: 'profile',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfileScreen()),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Erreur')),
      body: Center(child: Text('Page non trouvée: ${state.uri}')),
    ),
  );
});

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/home/screens/home_screen.dart';
import '../../features/home/screens/detail_screen.dart';
import '../config/constants.dart';

// Provider pour le router
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppConstants.homeRoute,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppConstants.homeRoute,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: '${AppConstants.detailRoute}/:id',
            name: 'detail',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return DetailScreen(todoId: id);
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Erreur')),
      body: Center(
        child: Text('Page non trouvée: ${state.uri}'),
      ),
    ),
  );
});

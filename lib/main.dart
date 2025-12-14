import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/config/theme.dart';
import 'core/config/constants.dart';
import 'core/router/app_router.dart';
import 'features/profile/providers/theme_provider.dart';

// Créons un Provider simple pour stocker l'état initial
final onboardingSeenProvider = StateProvider<bool>((ref) => false);

Future<void> main() async {
  // 1. On s'assure que le moteur Flutter est prêt
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialiser les locales francaises pour intl
  await initializeDateFormatting('fr_FR', null);
  Intl.defaultLocale = 'fr_FR';

  // 3. On charge les préférences AVANT de lancer l'app
  final prefs = await SharedPreferences.getInstance();
  final hasSeen = prefs.getBool(AppConstants.keyOnboardingSeen) ?? false;

  runApp(
    ProviderScope(
      // 4. On injecte la valeur initiale dans Riverpod
      overrides: [onboardingSeenProvider.overrideWith((ref) => hasSeen)],
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    // On récupère le router configuré (voir étape 2 ci-dessous)
    final router = ref.watch(routerProvider);

    // 4. On retourne UNIQUEMENT MaterialApp.router
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      locale: const Locale('fr', 'FR'),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router, // Tout passe par ici !
    );
  }
}

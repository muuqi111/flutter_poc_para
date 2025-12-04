import 'package:flutter/material.dart';

/// Palette de couleurs personnalisées pour l'application
class AppColors {
  // Couleurs primaires - Thème eau/pluie
  static const Color cyan = Color(0xFF00BCD4);
  static const Color cyanLight = Color(0xFF62EFFF);
  static const Color cyanDark = Color(0xFF008BA3);

  // Couleurs de statut
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Couleurs pour les statuts de borne
  static const Color stationOnline = Color(0xFF4CAF50);
  static const Color stationOffline = Color(0xFF9E9E9E);
  static const Color stationMaintenance = Color(0xFFFF9800);

  // Couleurs pour les parapluies
  static const Color umbrellaAvailable = Color(0xFF4CAF50);
  static const Color umbrellaRented = Color(0xFFFFC107);
  static const Color umbrellaBroken = Color(0xFFF44336);
  static const Color umbrellaCharging = Color(0xFF2196F3);

  // Couleurs de fond
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFF121212);

  // Gradient eau
  static const LinearGradient waterGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF00BCD4),
      Color(0xFF0097A7),
    ],
  );

  // Gradient pluie
  static const LinearGradient rainGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF00ACC1),
      Color(0xFF00BCD4),
      Color(0xFF26C6DA),
    ],
  );
}

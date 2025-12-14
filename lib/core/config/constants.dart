class AppConstants {
  // App Info
  static const String appName = 'Rainy';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Location de parapluies en libre-service';

  // Spacing
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingXxl = 48.0;

  // Border Radius
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 9999.0;

  // Animation Duration
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // Routes
  static const String onboardingRoute = '/onboarding';
  static const String mapRoute = '/';
  static const String scanQrRoute = '/scan-qr';
  static const String unlockSuccessRoute = '/unlock-success';
  static const String activeRentalRoute = '/active-rental';
  static const String rentalSummaryRoute = '/rental-summary';
  static const String profileRoute = '/profile';
  static const String historyRoute = '/history';
  static const String settingsRoute = '/settings';

  // Tarification horaire
  static const double hourlyRate = 0.20;             // 0,20EUR par heure
  static const int maxRentalHours = 100;             // 100 heures max
  static const double penaltyFee = 35.00;            // 35EUR de penalite apres 100h

  // Seuils d'alerte
  static const int warningThresholdHours = 80;       // Avertissement a 80h
  static const int criticalThresholdHours = 95;      // Alerte critique a 95h

  // Penalites
  static const double damageFee = 5.00;              // 5EUR si parapluie abime
  static const double lossFee = 15.00;               // 15EUR si perdu

  // Géolocalisation
  static const double proximityRadiusMeters = 50.0; // Rayon de proximité pour scanner QR (mètres)
  static const double defaultMapZoom = 14.0; // Zoom par défaut de la carte
  static const double stationDetailZoom = 16.0; // Zoom pour voir une borne en détail

  // Coordonnées par défaut (Liège - Place Saint-Lambert)
  static const double defaultLatitude = 50.6412;
  static const double defaultLongitude = 5.5739;

  // Capacités des bornes
  static const int minStationCapacity = 6;
  static const int maxStationCapacity = 12;

  // Shared Preferences Keys
  static const String keyOnboardingSeen = 'onboarding_seen';
  static const String keyThemeMode = 'theme_mode';
  static const String keyLanguage = 'language';
  static const String keyActiveRental = 'active_rental';
  static const String keyRentalHistory = 'rental_history';

  // Images & Assets
  static const String logoPath = 'assets/images/logo.png';
  static const String umbrellaIconPath = 'assets/icons/umbrella.svg';

  // Durées et timeouts
  static const Duration qrScanTimeout = Duration(seconds: 30);
  static const Duration unlockAnimationDuration = Duration(seconds: 2);
  static const Duration rentalTimerUpdateInterval = Duration(seconds: 1);
}
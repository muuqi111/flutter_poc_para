import 'package:flutter/material.dart';

/// Extensions utiles sur String
extension StringExtensions on String {
  /// Capitalise la première lettre
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Capitalise chaque mot
  String capitalizeWords() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  /// Vérifie si la chaîne est vide ou null
  bool get isNullOrEmpty => isEmpty;

  /// Vérifie si la chaîne n'est pas vide
  bool get isNotNullOrEmpty => isNotEmpty;

  /// Tronque la chaîne à une longueur maximale avec "..."
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }

  /// Supprime tous les espaces
  String removeAllSpaces() => replaceAll(RegExp(r'\s+'), '');

  /// Remplace les virgules par des points (utile pour les nombres)
  String commaToPoint() => replaceAll(',', '.');
}

/// Extensions utiles sur DateTime
extension DateTimeExtensions on DateTime {
  /// Vérifie si la date est aujourd'hui
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Vérifie si la date était hier
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Vérifie si la date est dans le futur
  bool get isFuture => isAfter(DateTime.now());

  /// Vérifie si la date est dans le passé
  bool get isPast => isBefore(DateTime.now());

  /// Retourne le début de la journée (00:00:00)
  DateTime get startOfDay => DateTime(year, month, day);

  /// Retourne la fin de la journée (23:59:59)
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59);

  /// Ajoute des jours ouvrables (exclut samedi et dimanche)
  DateTime addWorkDays(int days) {
    DateTime date = this;
    int addedDays = 0;
    while (addedDays < days) {
      date = date.add(const Duration(days: 1));
      if (date.weekday != DateTime.saturday &&
          date.weekday != DateTime.sunday) {
        addedDays++;
      }
    }
    return date;
  }
}

/// Extensions utiles sur BuildContext
extension BuildContextExtensions on BuildContext {
  /// Accès rapide au thème
  ThemeData get theme => Theme.of(this);

  /// Accès rapide au schéma de couleurs
  ColorScheme get colorScheme => theme.colorScheme;

  /// Accès rapide au text theme
  TextTheme get textTheme => theme.textTheme;

  /// Accès rapide aux dimensions de l'écran
  Size get screenSize => MediaQuery.of(this).size;

  /// Accès rapide à la largeur de l'écran
  double get screenWidth => screenSize.width;

  /// Accès rapide à la hauteur de l'écran
  double get screenHeight => screenSize.height;

  /// Vérifie si le clavier est ouvert
  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom > 0;

  /// Vérifie si l'appareil est en mode portrait
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  /// Vérifie si l'appareil est en mode paysage
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  /// Affiche un SnackBar simple
  void showSnackBar(String message, {Duration? duration}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration ?? const Duration(seconds: 3),
      ),
    );
  }

  /// Affiche un SnackBar de succès (vert)
  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Affiche un SnackBar d'erreur (rouge)
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  /// Ferme le clavier
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }
}

/// Extensions utiles sur double
extension DoubleExtensions on double {
  /// Arrondit à N décimales
  double roundToDecimals(int decimals) {
    final mod = 10.0 * decimals;
    return (this * mod).round().toDouble() / mod;
  }

  /// Vérifie si le nombre est entre min et max (inclus)
  bool isBetween(double min, double max) => this >= min && this <= max;
}

/// Extensions utiles sur List
extension ListExtensions<T> on List<T> {
  /// Retourne un élément aléatoire de la liste
  T get random => this[DateTime.now().microsecondsSinceEpoch % length];

  /// Vérifie si la liste est nulle ou vide
  bool get isNullOrEmpty => isEmpty;

  /// Vérifie si la liste n'est pas nulle ni vide
  bool get isNotNullOrEmpty => isNotEmpty;
}

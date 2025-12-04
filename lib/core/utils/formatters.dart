import 'package:intl/intl.dart';

/// Utilitaires de formatage pour l'application
class Formatters {
  /// Formate un prix en euros (ex: 1.50 → "1,50 €")
  static String formatPrice(double price) {
    return '${price.toStringAsFixed(2).replaceAll('.', ',')} €';
  }

  /// Formate une durée en minutes vers format lisible (ex: 75min → "1h 15min")
  static String formatDuration(int minutes) {
    if (minutes < 60) {
      return '${minutes}min';
    }
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (mins == 0) {
      return '${hours}h';
    }
    return '${hours}h ${mins}min';
  }

  /// Formate une durée en format HH:MM:SS pour le timer
  static String formatTimer(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Formate une date en format court (ex: "12 déc. 2024")
  static String formatDateShort(DateTime date) {
    return DateFormat('dd MMM yyyy', 'fr_FR').format(date);
  }

  /// Formate une date avec heure (ex: "12 déc. 2024 à 14h30")
  static String formatDateTimeFull(DateTime date) {
    return DateFormat('dd MMM yyyy \'à\' HH\'h\'mm', 'fr_FR').format(date);
  }

  /// Formate une date relative (ex: "Il y a 2 jours", "Aujourd'hui", "Hier")
  static String formatDateRelative(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Aujourd\'hui';
    } else if (difference.inDays == 1) {
      return 'Hier';
    } else if (difference.inDays < 7) {
      return 'Il y a ${difference.inDays} jours';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return weeks == 1 ? 'Il y a 1 semaine' : 'Il y a $weeks semaines';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return months == 1 ? 'Il y a 1 mois' : 'Il y a $months mois';
    } else {
      final years = (difference.inDays / 365).floor();
      return years == 1 ? 'Il y a 1 an' : 'Il y a $years ans';
    }
  }

  /// Formate l'heure seule (ex: "14h30")
  static String formatTimeOnly(DateTime date) {
    return DateFormat('HH\'h\'mm').format(date);
  }

  /// Formate un numéro de téléphone (ex: "0471234567" → "0471 23 45 67")
  static String formatPhoneNumber(String phone) {
    if (phone.length != 10) return phone;
    return '${phone.substring(0, 4)} ${phone.substring(4, 6)} ${phone.substring(6, 8)} ${phone.substring(8)}';
  }

  /// Formate un pourcentage (ex: 0.75 → "75%")
  static String formatPercentage(double value) {
    return '${(value * 100).toStringAsFixed(0)}%';
  }

  /// Formate une distance en mètres ou kilomètres (ex: 1500m → "1,5 km")
  static String formatDistance(double meters) {
    if (meters < 1000) {
      return '${meters.toStringAsFixed(0)} m';
    }
    final km = meters / 1000;
    return '${km.toStringAsFixed(1).replaceAll('.', ',')} km';
  }
}
